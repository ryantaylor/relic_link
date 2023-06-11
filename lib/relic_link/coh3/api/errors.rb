# frozen_string_literal: true

module RelicLink
  module Coh3
    module Api
      # Errors specific to the Relic CoH3 API.
      module Errors
        # Raised when querying for a leaderboard that doesn't exist.
        class NotFound < RelicError; end
        # Raised when querying for aliases that don't exist.
        class UnknownAliases < RelicError; end
        # Raised when querying for profile IDs that don't exist.
        class UnknownProfileIds < RelicError; end
        # Raised when querying for profile names (such as Steam IDs) that don't exist.
        class UnregisteredProfileName < RelicError; end

        # Mapping of Relic error messages to error classes.
        ERROR_CLASSES = {
          'NOT_FOUND' => NotFound,
          'UNKNOWN_ALIASES' => UnknownAliases,
          'UNKNOWN_PROFILE_IDS' => UnknownProfileIds,
          'UNREGISTERED_PROFILE_NAME' => UnregisteredProfileName
        }.freeze
      end
    end
  end
end
