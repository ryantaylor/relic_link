# frozen_string_literal: true

require 'relic_link'
require 'vcr'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  VCR.configure do |vcr|
    vcr.cassette_library_dir = 'spec/fixtures'
    vcr.hook_into :faraday
    vcr.default_cassette_options = {
      :match_requests_on => [:method,
                             VCR.request_matchers.uri_without_param(:callNum)]
    }
  end
end
