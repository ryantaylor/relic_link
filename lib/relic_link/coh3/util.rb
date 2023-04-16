# frozen_string_literal: true

module RelicLink
  module Coh3
    module Util
      def array_params(options)
        options.transform_values do |value|
          JSON.generate(Array(value))
        end
      end
    end
  end
end
