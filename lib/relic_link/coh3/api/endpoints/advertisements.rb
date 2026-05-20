# frozen_string_literal: true

module RelicLink
  module Coh3
    module Api
      module Endpoints
        # Endpoint definitions for the internal CoH3 advertisement API.
        module Advertisements
          PAGE_SIZE = 20

          # Fetch all games currently observable by spectators. Paginates automatically
          # until all results are retrieved.
          #
          # This is a private internal Relic endpoint that returns games currently open
          # to spectators. Both +data_checksum+ and +app_binary_checksum+ act as
          # version-compatibility filters — only games matching both checksums are returned.
          #
          # @option options [String] :token
          #   Valid CoH3 game client authentication token (required)
          # @option options [Integer] :data_checksum
          #   Version-specific CRC32 of game data files (required)
          # @option options [Integer] :app_binary_checksum
          #   PE build number of the game binary (required)
          #
          # @raise [ArgumentError] if one of the required parameters are not provided.
          # @raise [RelicLink::Errors::ServerError] if Relic's API is down.
          # @raise [RelicLink::Errors::UnauthorizedError] if the +token+ provided is invalid.
          def find_observable_advertisements(options = {})
            validate_advertisement_options!(options)
            fetch_all_advertisement_pages('findObservableAdvertisements',
                                          observable_advertisement_params(options))
          end

          # Fetch all active game lobbies (ranked and custom). Same parameter shape as
          # +find_observable_advertisements+; paginates automatically.
          #
          # @option options [String] :token
          #   Valid CoH3 game client authentication token (required)
          # @option options [Integer] :data_checksum
          #   Version-specific CRC32 of game data files (required)
          # @option options [Integer] :app_binary_checksum
          #   PE build number of the game binary (required)
          #
          # @raise [ArgumentError] if one of the required parameters are not provided.
          # @raise [RelicLink::Errors::ServerError] if Relic's API is down.
          # @raise [RelicLink::Errors::UnauthorizedError] if the +token+ provided is invalid.
          def find_advertisements(options = {})
            validate_advertisements_options!(options)
            fetch_all_advertisement_pages('findAdvertisements',
                                          advertisements_params(options))
          end

        private

          def fetch_all_advertisement_pages(endpoint, params)
            results = []
            start   = 0
            loop do
              page = get(advertisements, endpoint, params.merge(start:, count: PAGE_SIZE))
              ads  = Array(page[1])
              results.concat(ads)
              break if ads.size < PAGE_SIZE

              start += PAGE_SIZE
            end
            results
          end

          def observable_advertisement_params(options)
            base_advertisement_params(options).merge(observerGroupID: -2)
          end

          def base_advertisement_params(options)
            {
              connect_id: options[:token],
              sessionID: options[:token],
              appBinaryChecksum: options[:app_binary_checksum],
              dataChecksum: options[:data_checksum],
              modDLLChecksum: 0,
              modDLLFile: 'INVALID',
              modName: 'INVALID',
              modVersion: 'INVALID',
              versionFlags: 0,
              callNum: rand(1..999),
              desc: 0,
              sortOrder: 0
            }
          end

          def advertisements_params(options)
            base_advertisement_params(options).merge(matchtype_id: options[:matchtype_id])
          end

          def validate_advertisement_options!(options)
            missing = []
            missing << 'token'               if options[:token].nil?
            missing << 'data_checksum'       if options[:data_checksum].nil?
            missing << 'app_binary_checksum' if options[:app_binary_checksum].nil?
            missing_str = missing.map { |s| ":#{s}" }.join(', ')

            raise ArgumentError, "Missing required params #{missing_str}" unless missing.empty?

            true
          end

          def validate_advertisements_options!(options)
            validate_advertisement_options!(options)
            return if options[:matchtype_id]

            raise ArgumentError, 'Missing required params :matchtype_id'
          end
        end
      end
    end
  end
end
