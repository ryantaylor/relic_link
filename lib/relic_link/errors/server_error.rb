# frozen_string_literal: true

module RelicLink
  module Errors
    # Base wrapper for API server errors.
    class ServerError < ::Faraday::Error
      attr_reader :response

      def initialize(message, response)
        @response = response
        super(message)
      end
    end

    # Raised when an API response cannot be parsed.
    class ParsingError < ServerError
      def initialize(response)
        super('parsing_error', response)
      end
    end

    # Base wrapper for API HTTP request errors.
    class HttpRequestError < ServerError; end

    # Raised when a 400 is returned in an API response.
    class BadRequestError < HttpRequestError
      def initialize(response)
        super('bad_request', response)
      end
    end

    # Raised when a 429 is returned in an API response.
    class RateLimitError < HttpRequestError
      def initialize(response)
        super('rate_limited', response)
      end
    end

    # Raised when an API request times out.
    class TimeoutError < HttpRequestError
      def initialize(response)
        super('timeout_error', response)
      end
    end

    # Raised when a 5xx is returned in an API response.
    class UnavailableError < HttpRequestError
      def initialize(response)
        super('unavailable_error', response)
      end
    end
  end
end
