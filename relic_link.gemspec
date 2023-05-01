# frozen_string_literal: true

require_relative 'lib/relic_link/version'

Gem::Specification.new do |spec|
  spec.name = 'relic_link'
  spec.version = RelicLink::VERSION
  spec.authors = ['ryantaylor']
  spec.email = ['2320507+ryantaylor@users.noreply.github.com']

  spec.summary = 'Wrapper for Relic APIs'
  spec.description = 'Wraps Relic APIs for easy access in Ruby. Current supports CoH3 stats/leaderboards API.'
  spec.homepage = 'https://github.com/ryantaylor/relic_link'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.1.0'

  spec.metadata["allowed_push_host"] = 'https://rubygems.com'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday', '~> 2.7'

  spec.metadata['rubygems_mfa_required'] = 'true'
end
