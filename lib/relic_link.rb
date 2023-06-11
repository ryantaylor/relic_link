# frozen_string_literal: true

require 'faraday'
require 'hashie'
require 'json'

require_relative 'relic_link/logger'
require_relative 'relic_link/coh3/config'

require_relative 'relic_link/errors/server_error'
require_relative 'relic_link/coh3/api/errors/relic_error'
require_relative 'relic_link/coh3/api/error'
require_relative 'relic_link/coh3/api/errors'
require_relative 'relic_link/coh3/faraday/response/raise_error'
require_relative 'relic_link/faraday/response/wrap_error'

require_relative 'relic_link/coh3/util'
require_relative 'relic_link/coh3/api/endpoints'
require_relative 'relic_link/faraday/request'
require_relative 'relic_link/coh3/faraday/connection'
require_relative 'relic_link/coh3/client'
require_relative 'relic_link/version'

# Relic API client wrappers. To query the CoH3 API see {Coh3::Client}.
module RelicLink
end
