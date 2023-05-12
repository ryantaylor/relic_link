# frozen_string_literal: true

module RelicLink
  # Company of Heroes 3 API wrapper.
  module Coh3
    # Configuration options for the CoH3 API client.
    module Config
      extend self

      # Configurable attributes
      ATTRIBUTES = %i[
        logger
      ].freeze

      attr_accessor(*ATTRIBUTES)

      # Set all config options back to defaults.
      def reset
        self.logger = nil
      end

      module_function :reset
    end

    class << self
      # Set configuration options. Can be set on the returned object
      # directly or in a block.
      def configure
        block_given? ? yield(Config) : Config
      end

      # Current config module.
      def config
        Config
      end
    end
  end
end

RelicLink::Coh3::Config.reset
