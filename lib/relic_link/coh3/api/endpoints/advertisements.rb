# frozen_string_literal: true

module RelicLink
  module Coh3
    module Api
      module Endpoints
        # Endpoint definitions for the internal CoH3 advertisement API.
        module Advertisements
          # Fetch games currently observable by spectators.
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
          # @option options [Integer] :start (0)
          #   Zero-based index of the first result to return.
          # @option options [Integer] :count (200)
          #   Number of results to return. Must be an integer between 1 and 200.
          #
          # @raise [ArgumentError] if one of the required parameters are not provided.
          # @raise [RelicLink::Errors::ServerError] if Relic's API is down.
          # @raise [RelicLink::Errors::RateLimitError] if you're rate-limited.
          # @raise [RelicLink::Errors::UnauthorizedError] if the +token+ provided is invalid.
          # @raise [RelicLink::Errors::BadRequestError] if inputs are missing or violate type constraints.
          def find_observable_advertisements(options = {})
            validate_observable_advertisements_options!(options)
            get(advertisements, 'findObservableAdvertisements',
                observable_advertisements_params(options))
          end

          # Fetch active game lobbies (ranked and custom) for a given match type.
          #
          # @option options [String] :token
          #   Valid CoH3 game client authentication token (required)
          # @option options [Integer] :data_checksum
          #   Version-specific CRC32 of game data files (required)
          # @option options [Integer] :app_binary_checksum
          #   PE build number of the game binary (required)
          # @option options [Integer] :matchtype_id
          #   Match type to filter by (required)
          # @option options [Integer] :start (0)
          #   Zero-based index of the first result to return.
          # @option options [Integer] :count (200)
          #   Number of results to return. Must be an integer between 1 and 200.
          #
          # @raise [ArgumentError] if one of the required parameters are not provided.
          # @raise [RelicLink::Errors::ServerError] if Relic's API is down.
          # @raise [RelicLink::Errors::RateLimitError] if you're rate-limited.
          # @raise [RelicLink::Errors::UnauthorizedError] if the +token+ provided is invalid.
          # @raise [RelicLink::Errors::BadRequestError] if inputs are missing or violate type constraints.
          def find_advertisements(options = {})
            validate_advertisements_options!(options)
            get(advertisements, 'findAdvertisements',
                advertisements_params(options))
          end

        private

          def observable_advertisements_params(options)
            base_advertisement_params(options).merge(observerGroupID: -2)
          end

          def advertisements_params(options)
            base_advertisement_params(options).merge(matchtype_id: options[:matchtype_id])
          end

          def base_advertisement_params(options) # rubocop:disable Metrics/MethodLength
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
              sortOrder: 0,
              start: options.fetch(:start, 0),
              count: options.fetch(:count, 200)
            }
          end

          def validate_observable_advertisements_options!(options)
            missing = []
            missing << 'token'               if options[:token].nil?
            missing << 'data_checksum'       if options[:data_checksum].nil?
            missing << 'app_binary_checksum' if options[:app_binary_checksum].nil?
            missing_str = missing.map { |s| ":#{s}" }.join(', ')

            raise ArgumentError, "Missing required params #{missing_str}" unless missing.empty?

            true
          end

          def validate_advertisements_options!(options)
            missing = []
            missing << 'token'               if options[:token].nil?
            missing << 'data_checksum'       if options[:data_checksum].nil?
            missing << 'app_binary_checksum' if options[:app_binary_checksum].nil?
            missing << 'matchtype_id'        if options[:matchtype_id].nil?
            missing_str = missing.map { |s| ":#{s}" }.join(', ')

            raise ArgumentError, "Missing required params #{missing_str}" unless missing.empty?

            true
          end
        end
      end
    end
  end
end
