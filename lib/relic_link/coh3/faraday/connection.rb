# frozen_string_literal: true

module RelicLink
  module Coh3
    module Faraday
      module Connection
        private

        def connection
          @connection ||= ::Faraday.new(
            url: 'https://coh3-api.reliclink.com/community/leaderboard'
          ) do |f|
            f.params[:title] = 'coh3'

            f.response :logger
            f.response :json
          end
        end
      end
    end
  end
end
