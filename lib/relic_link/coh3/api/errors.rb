# frozen_string_literal: true

module RelicLink
  module Coh3
    module Api
      module Errors
        class NotFound < RelicError; end
        class UnknownAliases < RelicError; end
        class UnknownProfileIds < RelicError; end
        class UnregisteredProfileName < RelicError; end

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
