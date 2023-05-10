# frozen_string_literal: true

require 'faraday/mashify'

module RelicLink
  module Coh3
    module Faraday
      # Faraday connection implementation for API requests. You shouldn't
      # ever have to use this directly.
      module Connection
        private

        def connection
          @connection ||= ::Faraday.new(
            url: 'https://coh3-api.reliclink.com/community/leaderboard'
          ) do |f|
            f.params[:title] = 'coh3'

            f.response :logger
            f.response :mashify
            f.response :json
          end
        end
      end
    end
  end
end
