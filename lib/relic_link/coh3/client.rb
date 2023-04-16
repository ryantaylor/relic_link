# frozen_string_literal: true

module RelicLink
  module Coh3
    class Client
      include ::RelicLink::Faraday::Request
      include Faraday::Connection
      include Api::Endpoints
      include Util
    end
  end
end
