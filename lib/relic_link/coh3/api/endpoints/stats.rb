# frozen_string_literal: true

module RelicLink
  module Coh3
    module Api
      module Endpoints
        module Stats
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
