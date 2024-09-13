# frozen_string_literal: true

module RelicLink
  module Coh3
    module Faraday
      # Wrapper for +Hashie::Mash+ that disables conflict warnings.
      class ResponseMash < Hashie::Mash
        disable_warnings
      end
    end
  end
end
