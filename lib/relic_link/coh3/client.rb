# frozen_string_literal: true

module RelicLink
  module Coh3
    # Main entrypoint for the CoH3 API. Create a new instance of
    # this class in order to begin querying the CoH3 API.
    #
    # @example
    #   client = RelicLink::Coh3::Client.new
    #   client.available_leaderboards
    class Client
      include ::RelicLink::Faraday::Request
      include Faraday::Connection
      include Api::Endpoints
      include Util
    end
  end
end
