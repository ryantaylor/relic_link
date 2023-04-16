# frozen_string_literal: true

RSpec.describe RelicLink do
  it 'has a version number' do
    expect(RelicLink::VERSION).to_not be nil
  end

  describe 'client' do
    let(:client) { RelicLink::Coh3::Client.new }

    describe '.personal_stats' do
      it 'queries with profile IDs' do
        VCR.use_cassette('personal_stats_profile_ids') do
          body = client.personal_stats(profile_ids: [8230])
          expect(body.dig('result', 'code')).to be_zero
          expect(body['statGroups'].first['members']).to_not be_empty
        end
      end

      it 'queries with aliases' do
        VCR.use_cassette('personal_stats_aliases') do
          body = client.personal_stats(aliases: %w[Inverse])
          expect(body.dig('result', 'code')).to be_zero
          expect(body['statGroups'].first['members']).to_not be_empty
        end
      end

      it 'queries with Steam IDs' do
        VCR.use_cassette('personal_stats_steam_ids') do
          body = client.personal_stats(profile_names: %w[/steam/76561197999799366])
          expect(body.dig('result', 'code')).to be_zero
          expect(body['statGroups'].first['members']).to_not be_empty
        end
      end
    end

    describe '.recent_match_history' do
      it 'queries with profile IDs' do
        VCR.use_cassette('recent_match_history_profile_ids') do
          body = client.recent_match_history(profile_ids: [8230])
          expect(body.dig('result', 'code')).to be_zero
          expect(body['matchHistoryStats']).to_not be_empty
        end
      end

      it 'queries with aliases' do
        VCR.use_cassette('recent_match_history_aliases') do
          body = client.recent_match_history(aliases: %w[Inverse])
          expect(body.dig('result', 'code')).to be_zero
          expect(body['matchHistoryStats']).to_not be_empty
        end
      end

      it 'queries with Steam IDs' do
        VCR.use_cassette('recent_match_history_steam_ids') do
          body = client.recent_match_history(profile_names: %w[/steam/76561197999799366])
          expect(body.dig('result', 'code')).to be_zero
          expect(body['matchHistoryStats']).to_not be_empty
        end
      end
    end

    describe '.recent_match_history_by_profile_id' do
      it 'queries with profile ID' do
        VCR.use_cassette('recent_match_history_by_profile_id') do
          body = client.recent_match_history_by_profile_id(8230)
          expect(body.dig('result', 'code')).to be_zero
          expect(body['matchHistoryStats']).to_not be_empty
        end
      end
    end

    describe '.available_leaderboards' do
      it 'queries available leaderboards' do
        VCR.use_cassette('available_leaderboards') do
          body = client.available_leaderboards
          expect(body.dig('result', 'code')).to be_zero
          expect(body['leaderboards']).to_not be_empty
          expect(body['matchTypes']).to_not be_empty
          expect(body['races']).to_not be_empty
          expect(body['factions']).to_not be_empty
          expect(body['leaderboardRegions']).to_not be_empty
        end
      end
    end

    describe '.leaderboard' do
      RelicLink::Coh3::Api::Endpoints::Leaderboards::Ids.constants.each do |constant|
        context "for #{constant}" do
          let(:leaderboard_id) { RelicLink::Coh3::Api::Endpoints::Leaderboards::Ids.const_get(constant) }

          it "queries base #{constant} leaderboard" do
            VCR.use_cassette("leaderboard_#{constant.to_s.downcase}") do
              body = client.leaderboard(leaderboard_id:)
              expect(body.dig('result', 'code')).to be_zero
            end
          end

          it "queries #{constant} with additional filters" do
            VCR.use_cassette("leaderboard_#{constant.to_s.downcase}_filtered") do
              body = client.leaderboard(leaderboard_id:,
                                        count: 100,
                                        start: 1,
                                        sort_by: RelicLink::Coh3::Api::Endpoints::Leaderboards::Sort::ELO)
              expect(body.dig('result', 'code')).to be_zero
            end
          end
        end
      end
    end
  end
end
