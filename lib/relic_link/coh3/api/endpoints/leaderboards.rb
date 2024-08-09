# frozen_string_literal: true

require_relative 'leaderboards/ids'
require_relative 'leaderboards/sort'

module RelicLink
  module Coh3
    module Api
      module Endpoints
        # Endpoint definitions for the CoH3 leaderboards API.
        module Leaderboards
          # List available leaderboards and associated metadata.
          #
          # @raise [RelicLink::Errors::ServerError] if Relic's API is down.
          # @raise [RelicLink::Errors::RateLimitError] if you're rate-limited.
          def available_leaderboards
            get(stats, 'getAvailableLeaderboards')
          end

          # Retrieve the leaderboard with the given ID. For your convenience
          # a list of IDs is provided inside {Ids}, or you can retrieve a list
          # of available IDs using {#available_leaderboards}.
          #
          # @option options [Ids, Integer] :leaderboard_id
          #   ID of the leaderboard to be retrieved (required).
          # @option options [Integer] :start (1)
          #   Leaderboard position to start retrieval from. Passing a value of
          #   1 will retrieve leaderboard information from the beginning. Must
          #   be an integer between 1 and 2147483647.
          # @option options [Integer] :count (200)
          #   Number of leaderboard entries to retrieve in the given call.
          #   Must be an integer between 1 and 200.
          # @option options [Sort] :sort_by (Sort::ELO)
          #   Field to sort the leaderboard entries by.
          #
          # @raise [ArgumentError] if the required parameters aren't provided.
          # @raise [RelicLink::Errors::ServerError] if Relic's API is down.
          # @raise [RelicLink::Errors::RateLimitError] if you're rate-limited.
          # @raise [Errors::NotFound] if +leaderboard_id+ does not correspond to a leaderboard.
          # @raise [RelicLink::Errors::BadRequestError] if +start+, +count+, or +sort_by+ are outside the
          #   limits enumerated above.
          def leaderboard(options = {})
            raise ArgumentError, 'Required argument :leaderboard_id missing' if options[:leaderboard_id].nil?

            get(stats, 'getLeaderboard2', format_sort_key(options))
          end

        private

          def format_sort_key(options)
            options.transform_keys do |key|
              key == :sort_by ? :sortBy : key
            end
          end
        end
      end
    end
  end
end
