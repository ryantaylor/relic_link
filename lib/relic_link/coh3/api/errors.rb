# frozen_string_literal: true

module RelicLink
  module Coh3
    module Api
      module Errors
        class UnregisteredProfileName < RelicError; end
        class UnknownProfileIds < RelicError; end
        class UnknownAliases < RelicError; end

        ERROR_CLASSES = {
          3 => UnregisteredProfileName,
          5 => UnregisteredProfileName,
          6 => UnknownProfileIds,
          7 => UnknownProfileIds,
          9 => UnknownAliases,
          10 => UnknownAliases
        }.freeze
      end
    end
  end
end
