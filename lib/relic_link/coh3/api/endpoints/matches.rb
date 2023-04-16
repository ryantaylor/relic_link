# frozen_string_literal: true

module RelicLink
  module Coh3
    module Api
      module Endpoints
        module Matches
          def recent_match_history(options = {})
            unless options.keys.intersect?(%i[profile_ids aliases profile_names])
              raise ArgumentError, 'Missing one of required arguments :profile_ids, :aliases, or :profile_names'
            end

            get('getRecentMatchHistory', array_params(options))
          end

          def recent_match_history_by_profile_id(profile_id)
            raise ArgumentError, 'Required argument :profile_id missing' if profile_id.nil?

            get('getRecentMatchHistoryByProfileId', { profile_id: })
          end
        end
      end
    end
  end
end
