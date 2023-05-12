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

      attr_accessor(*RelicLink::Coh3::Config::ATTRIBUTES)

      # Initializes a new client.
      #
      # @option options [Logger] :logger
      #   Instance of a logging class. If not provided, defaults to +STDOUT+ at +Logging::WARN+.
      #
      # @return [Client]
      def initialize(options = {})
        RelicLink::Coh3::Config::ATTRIBUTES.each do |key|
          send("#{key}=", options.fetch(key, RelicLink::Coh3.config.send(key)))
        end
        @logger ||= RelicLink::Coh3::Config.logger || RelicLink::Logger.default
      end

      class << self
        # Set configuration options. Can be set on the returned object
        # directly or in a block.
        def configure
          block_given? ? yield(RelicLink::Coh3::Config) : RelicLink::Coh3::Config
        end

        # Current config module.
        def config
          RelicLink::Coh3::Config
        end
      end
    end
  end
end
