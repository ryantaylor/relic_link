# frozen_string_literal: true

module RelicLink
  module Coh3
    module Api
      module Endpoints
        # Endpoint definitions for the internal CoH3 replays API.
        module Replays
          # Request a signed download URL for a replay at the given +path+, using the given
          # authentication +token+. Path values can be retrieved from any endpoint that returns
          # a player's game history, by looking for a +matchurls+ key in the JSON response.
          # Note that this is a protected internal endpoint, which means a request without a
          # valid token will return an authentication error. Tokens can be extracted from the
          # game client by setting up a man-in-the-middle proxy between your game client and
          # the Relic servers, but be warned that tokens expire quickly and this endpoint may
          # change at any time. Use at your own risk!
          #
          # Relic generally keeps a player's 10 most recent replay files, and files older than
          # that are removed from storage and inaccessible. When this happens, the replay is
          # considered expired and requests for that path will raise an error.
          #
          # @option options [String] :token
          #   Valid CoH3 game client authentication token (required)
          # @option options [String] :path
          #   Path to a CoH3 replay file stored on Relic's infrastructure (required)
          #
          # @raise [ArgumentError] if one of the required parameters are not provided.
          # @raise [RelicLink::Errors::ServerError] if Relic's API is down.
          # @raise [RelicLink::Errors::UnauthorizedError] if the +token+ provided is invalid.
          # @raise [Errors::ExpiredPath] if the file at the +path+ provided has expired or does not exist.
          def replay_url(options = {})
            validate_options!(options)
            get(replays, 'requestSignedReplayDownloadUri', {
              connect_id: options[:token],
              key:        options[:path],
              sessionID:  options[:token]
            })
          end

        private

          def validate_options!(options)
            missing = []
            missing << 'token' if options[:token].nil?
            missing << 'path' if options[:path].nil?
            missing_str = missing.map { |s| ":#{s}" }.join(', ')

            raise ArgumentError, "Missing required params #{missing_str}" unless missing.empty?
            true
          end
        end
      end
    end
  end
end
