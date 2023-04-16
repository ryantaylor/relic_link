# frozen_string_literal: true

module RelicLink
  module Faraday
    module Request
      def get(path, options = {})
        connection.get(path) do |req|
          req.params = req.params.merge(options)
        end.body
      end
    end
  end
end
