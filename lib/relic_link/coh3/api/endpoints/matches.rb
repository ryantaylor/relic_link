# frozen_string_literal: true

module RelicLink
  module Coh3
    module Api
      module Endpoints
        # Endpoint definitions for the CoH3 recent matches API.
        module Matches
          # Retrieve the match history information for the given player identifiers.
          # Note that multiple combinations of identifier types (such as +profile_ids+
          # and +aliases+ or +aliases+ and +profile_names+) are technically supported
          # but produce undefined behaviour on Relic's API. Therefore, it is recommended
          # to choose one identifier type when making requests to this endpoint.
          #
          # @option options [Array<Integer>] :profile_ids
          #   Internal Relic IDs of players whose stats you wish to retrieve (one of required).
          # @option options [Array<String>] :aliases
          #   Steam profile names of players whose stats you wish to retrieve. Names must match
          #   exactly and are case sensitive (one of required).
          # @option options [Array<Integer>] :profile_names
          #   Specially formatted Steam IDs of players whose stats you wish to retrieve. Must
          #   be in the format +/steam/<ID>+ (one of required).
          #
          # @raise [ArgumentError] if none of the required parameters are provided.
          # @raise [RelicLink::Errors::ServerError] if Relic's API is down.
          # @raise [RelicLink::Errors::RateLimitError] if you're rate-limited.
          # @raise [Errors::UnknownProfileIds] if no values in +profile_ids+ match known profile IDs.
          # @raise [Errors::UnknownAliases] if no values in +aliases+ match known aliases.
          # @raise [Errors::UnregisteredProfileName] if no values in +profile_names+ match known profile names.
          # @raise [RelicLink::Errors::BadRequestError] if inputs violate type constraints.
          def recent_match_history(options = {})
            unless options.keys.intersect?(%i[profile_ids aliases profile_names])
              raise ArgumentError, 'Missing one of required arguments :profile_ids, :aliases, or :profile_names'
            end

            get(stats, 'getRecentMatchHistory', array_params(options))
          end

          # Retrieve the match history information for the given profile ID. Profile
          # ID is an internal Relic player identifier that can be pulled from
          # leaderboard results (such as by calling {Leaderboards#leaderboard})
          # or match history results (like {#recent_match_history}) using other known
          # parameters such as +aliases+ or +profile_names+.
          #
          # @param profile_id [Integer] Internal Relic ID of player whose stats you wish to retrieve (required).
          #
          # @raise [ArgumentError] if no +profile_id+ provided.
          # @raise [RelicLink::Errors::ServerError] if Relic's API is down.
          # @raise [RelicLink::Errors::RateLimitError] if you're rate-limited.
          # @raise [RelicLink::Errors::BadRequestError] if input violates type constraints.
          def recent_match_history_by_profile_id(profile_id)
            raise ArgumentError, 'Required argument :profile_id missing' if profile_id.nil?

            get(stats, 'getRecentMatchHistoryByProfileId', { profile_id: })
          end
        end
      end
    end
  end
end
