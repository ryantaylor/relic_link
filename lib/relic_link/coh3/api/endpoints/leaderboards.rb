# frozen_string_literal: true

require_relative 'leaderboards/ids'
require_relative 'leaderboards/sort'

module RelicLink
  module Coh3
    module Api
      module Endpoints
        module Leaderboards
          def available_leaderboards
            get('getAvailableLeaderboards')
          end

          def leaderboard(options)
            raise ArgumentError, 'Required argument :leaderboard_id missing' if options[:leaderboard_id].nil?

            get('getLeaderboard2', format_sort_key(options))
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
