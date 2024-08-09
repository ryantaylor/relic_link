# frozen_string_literal: true

module RelicLink
  module Faraday
    # Wrapper for HTTP client +GET+ requests. You should never
    # have to use this directly.
    module Request
      def get(connection, path, options = {})
        connection.get(path) do |req|
          req.params = req.params.merge(options)
        end.body
      rescue ::Faraday::ParsingError => e
        raise RelicLink::Errors::ParsingError, e.response
      end
    end
  end
end
