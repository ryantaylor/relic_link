# frozen_string_literal: true

require_relative 'endpoints/leaderboards'
require_relative 'endpoints/matches'
require_relative 'endpoints/replays'
require_relative 'endpoints/stats'

module RelicLink
  module Coh3
    module Api
      module Endpoints
        include Leaderboards
        include Matches
        include Replays
        include Stats
      end
    end
  end
end
