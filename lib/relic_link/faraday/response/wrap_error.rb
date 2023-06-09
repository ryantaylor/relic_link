# frozen_string_literal: true

module RelicLink
  module Faraday
    module Response
      # Middleware to wrap generic API errors and raise them as exceptions.
      class WrapError < ::Faraday::Middleware
        UNAVAILABLE_ERROR_STATUSES = (500..599)

        def on_complete(env)
          return unless UNAVAILABLE_ERROR_STATUSES.cover?(env.status)

          raise RelicLink::Errors::UnavailableError, env.response
        end

        def call(env)
          super
        rescue ::Faraday::TimeoutError, ::Faraday::ConnectionFailed
          raise RelicLink::Errors::TimeoutError, env.response
        end
      end
    end
  end
end
