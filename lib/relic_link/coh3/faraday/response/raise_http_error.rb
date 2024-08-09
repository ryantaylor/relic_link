# frozen_string_literal: true

module RelicLink
  module Coh3
    module Faraday
      module Response
        # Middleware to catch CoH3 API errors and raise them as exceptions.
        class RaiseHttpError < ::Faraday::Middleware
          def on_complete(env)
            raise RelicLink::Errors::BadRequestError, env.response if env.status == 400
            raise RelicLink::Errors::UnauthorizedError, env.response if env.status == 401
            raise RelicLink::Errors::RateLimitError, env.response if env.status == 429
          end
        end
      end
    end
  end
end
