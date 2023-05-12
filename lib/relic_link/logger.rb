# frozen_string_literal: true

require 'logger'

module RelicLink
  # Default logging class.
  class Logger < ::Logger
    # Default logger, used when a logger is not provided in config.
    # Default log output is +STDOUT+ and log level is +Logger::WARN+.
    #
    # @return [::Logger]
    def self.default
      return @default if @default

      logger = new STDOUT
      logger.level = Logger::WARN
      @default = logger
    end
  end
end
