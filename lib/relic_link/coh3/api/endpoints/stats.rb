# frozen_string_literal: true

module RelicLink
  module Coh3
    module Api
      module Endpoints
        # Endpoint definitions for the CoH3 stats API.
        module Stats
          # Retrieve the personal stats for the given player identifiers. Note that
          # multiple combinations of identifier types (such as +profile_ids+ and
          # +aliases+ or +aliases+ and +profile_names+) are technically supported but
          # produce undefined behaviour on Relic's API. Therefore, it is recommended
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
          def personal_stats(options = {})
            unless options.keys.intersect?(%i[profile_ids aliases profile_names])
              raise ArgumentError, 'Missing one of required params :profile_ids, :aliases, or :profile_names'
            end

            get('getPersonalStat', array_params(options))
          end
        end
      end
    end
  end
end
