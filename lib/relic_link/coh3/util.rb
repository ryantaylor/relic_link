# frozen_string_literal: true

module RelicLink
  module Coh3
    # Miscellaneous utility and helper methods.
    module Util
      # Formats the options as JSON (mainly to format arrays correctly
      # for Relic's API).
      #
      # @param options (Hash) Parameters to be added to the query string.
      def array_params(options)
        options.transform_values do |value|
          JSON.generate(Array(value))
        end
      end
    end
  end
end
