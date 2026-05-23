# frozen_string_literal: true

module RelicLink
  module Coh3
    module Faraday
      module Response
        # Middleware to catch CoH3 advertisement API errors and raise them as exceptions.
        class RaiseAdvertisementError < ::Faraday::Middleware
          def on_complete(env)
            return unless env.success?

            body = env.body
            return unless body
            return if body.first.zero?

            raise RelicLink::Coh3::Api::Errors::RelicError.new('advertisement API error', env.response)
          end
        end
      end
    end
  end
end
