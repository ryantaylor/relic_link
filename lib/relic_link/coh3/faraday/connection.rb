# frozen_string_literal: true

require 'faraday/mashify'

module RelicLink
  module Coh3
    module Faraday
      # Faraday connection implementation for API requests. You shouldn't
      # ever have to use this directly.
      module Connection
      private

        def stats
          @stats ||= ::Faraday.new(
            url: 'https://coh3-api.reliclink.com/community/leaderboard'
          ) do |f|
            f.params[:title] = 'coh3'

            f.use ::RelicLink::Coh3::Faraday::Response::RaiseHttpError
            f.use ::RelicLink::Coh3::Faraday::Response::RaiseStatsError
            f.response :mashify
            f.response :json
            f.use ::RelicLink::Faraday::Response::WrapError
            f.response :logger, logger if logger
          end
        end

        def replays
          @replays ||= ::Faraday.new(
            url: 'https://coh3-api.reliclink.com/game/Replay'
          ) do |f|
            f.params[:callNum] = rand(5..354)

            f.use ::RelicLink::Coh3::Faraday::Response::RaiseHttpError
            f.use ::RelicLink::Coh3::Faraday::Response::RaiseReplayError
            f.response :mashify
            f.response :json
            f.use ::RelicLink::Faraday::Response::WrapError
            f.response :logger, logger if logger
          end
        end
      end
    end
  end
end
