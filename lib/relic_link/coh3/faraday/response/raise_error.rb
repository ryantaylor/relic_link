# frozen_string_literal: true

module RelicLink
  module Coh3
    module Faraday
      module Response
        # Middleware to catch CoH3 API errors and raise them as exceptions.
        class RaiseError < ::Faraday::Middleware
          def on_complete(env)
            raise RelicLink::Errors::BadRequestError, env.response if env.status == 400
            raise RelicLink::Errors::RateLimitError, env.response if env.status == 429

            return unless env.success?

            body = env.body
            return unless body

            return if body['result']['code'].zero?

            raise_relic_error!(body, env)
          end

        private

          def raise_relic_error!(body, env)
            error_message = body['result']['message']
            error_class = RelicLink::Coh3::Api::Errors::ERROR_CLASSES[error_message]
            error_class ||= RelicLink::Coh3::Api::Errors::RelicError
            raise error_class.new(error_message, env.response)
          end
        end
      end
    end
  end
end
