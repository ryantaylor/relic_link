# frozen_string_literal: true

module RelicLink
  module Coh3
    module Faraday
      module Response
        class RaiseError < ::Faraday::Middleware
          def on_complete(env)
            raise RelicLink::Errors::BadRequestError, env.response if env.status == 400

            return unless env.success?

            body = env.body
            return unless body

            code = body['result']['code']
            return if code.zero?

            error_message = body['result']['message']
            error_class = RelicLink::Coh3::Api::Errors::ERROR_CLASSES[code]
            error_class ||= RelicLink::Coh3::Api::Errors::RelicError
            raise error_class.new(error_message, env.response)
          end
        end
      end
    end
  end
end
