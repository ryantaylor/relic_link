# frozen_string_literal: true

module RelicLink
  module Coh3
    module Faraday
      module Response
        # Middleware to catch CoH3 API errors and raise them as exceptions.
        class RaiseReplayError < ::Faraday::Middleware
          def on_complete(env)
            return unless env.success?

            body = env.body
            return unless body

            raise RelicLink::Coh3::Api::Errors::ExpiredPath.new('path has expired', env.response) if body.first == 1
          end
        end
      end
    end
  end
end
