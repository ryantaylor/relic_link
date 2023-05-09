# RelicLink

[![Gem Version](https://badge.fury.io/rb/relic_link.svg)](https://badge.fury.io/rb/relic_link) [![Documentation](https://img.shields.io/badge/View-Documentation-blue.svg)](https://rubydoc.info/github/ryantaylor/relic_link/v0.1.0)

A client wrapper for Relic APIs. Currently supports the Company of Heroes 3 leaderboard, stats, and recent matches API.

## Installation

Add to Gemfile:
```
gem 'relic_link'
```
Then run `bundle install`.


## Usage

Currently the only Relic API supported is the Company of Heroes 3 API (PRs are welcome for other games/APIs though, and others may be added based on resourcing and demand).

In order to make requests to the API, you need to initialize a client:
```ruby
client = RelicLink::Coh3::Client.new
```
Then you can make requests to any of the supported CoH3 API endpoints:
```ruby
client.available_leaderboards
client.leaderboard(leaderboard_id: RelicLink::Coh3::Api::Endpoints::Leaderboards::Ids::AMERICAN_1V1)
client.recent_match_history(profile_ids: [8230])
client.recent_match_history_by_profile_id(8230)
client.personal_stats(profile_ids: [8230])
```
Consult the [documentation](https://rubydoc.info/github/ryantaylor/relic_link/v0.1.0) for all endpoints that have been discovered and are currently queryable. Note that Relic does not publish official documentation for their endpoints, so the functionality here is based on best estimates and is subject to change without warning. Please open an issue if you are aware of endpoints that are not exposed in this library!

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ryantaylor/relic_link.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
