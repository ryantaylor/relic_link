# frozen_string_literal: true

module RelicLink
  module Coh3
    module Api
      module Errors
        class RelicError < ::Faraday::Error
          attr_reader :response

          def initialize(message, response = nil)
            super message
            @response = response
          end

          def error
            response.body.error
          end

          def errors
            response.body.errors
          end

          def response_metadata
            response.body.response_metadata
          end
        end
      end
    end
  end
end
