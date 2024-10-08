# frozen_string_literal: true

RSpec.describe RelicLink do
  it 'has a version number' do
    expect(RelicLink::VERSION).not_to be_nil
  end

  describe 'client' do
    let(:client) { RelicLink::Coh3::Client.new }

    describe '.personal_stats' do
      it 'queries with profile IDs' do
        VCR.use_cassette('personal_stats_profile_ids') do
          body = client.personal_stats(profile_ids: [8230])
          expect(body.dig('result', 'code')).to be_zero
          expect(body['statGroups'].first['members']).not_to be_empty
        end
      end

      context 'when profile IDs provided are not valid' do
        it 'returns an error' do
          VCR.use_cassette('personal_stats_profile_ids_error') do
            expect { client.personal_stats(profile_ids: [-1]) }
              .to raise_error(RelicLink::Coh3::Api::Errors::UnknownProfileIds)
          end
        end
      end

      context 'when profile IDs provided are of an incorrect format' do
        it 'returns an error' do
          VCR.use_cassette('personal_stats_profile_ids_error_format') do
            expect { client.personal_stats(profile_ids: ['butts']) }
              .to raise_error(RelicLink::Errors::BadRequestError)
          end
        end
      end

      it 'queries with aliases' do
        VCR.use_cassette('personal_stats_aliases') do
          body = client.personal_stats(aliases: %w[Inverse])
          expect(body.dig('result', 'code')).to be_zero
          expect(body['statGroups'].first['members']).not_to be_empty
        end
      end

      context 'when aliases provided are not valid' do
        it 'returns an error' do
          VCR.use_cassette('personal_stats_aliases_error') do
            expect { client.personal_stats(aliases: %w[SomeDudeWhoProbablyDefsDoesntExist]) }
              .to raise_error(RelicLink::Coh3::Api::Errors::UnknownAliases)
          end
        end
      end

      context 'when aliases provided are of an incorrect format' do
        it 'returns an error' do
          VCR.use_cassette('personal_stats_aliases_error_format') do
            expect { client.personal_stats(aliases: [-1]) }
              .to raise_error(RelicLink::Coh3::Api::Errors::UnknownAliases)
          end
        end
      end

      it 'queries with Steam IDs' do
        VCR.use_cassette('personal_stats_steam_ids') do
          body = client.personal_stats(profile_names: %w[/steam/76561197999799366])
          expect(body.dig('result', 'code')).to be_zero
          expect(body['statGroups'].first['members']).not_to be_empty
        end
      end

      context 'when Steam IDs provided are not valid' do
        it 'returns an error' do
          VCR.use_cassette('personal_stats_steam_ids_error') do
            expect { client.personal_stats(profile_names: %w[/steam/-1]) }
              .to raise_error(RelicLink::Coh3::Api::Errors::UnregisteredProfileName)
          end
        end
      end

      context 'when Steam IDs provided are of an incorrect format' do
        it 'returns an error' do
          VCR.use_cassette('personal_stats_steam_ids_error_format') do
            expect { client.personal_stats(profile_names: [-1]) }
              .to raise_error(RelicLink::Errors::BadRequestError)
          end
        end
      end
    end

    describe '.recent_match_history' do
      it 'queries with profile IDs' do
        VCR.use_cassette('recent_match_history_profile_ids') do
          body = client.recent_match_history(profile_ids: [8230])
          expect(body.dig('result', 'code')).to be_zero
          expect(body['matchHistoryStats']).not_to be_empty
        end
      end

      context 'when profile IDs provided are not valid' do
        it 'returns an error' do
          VCR.use_cassette('recent_match_history_profile_ids_error') do
            expect { client.recent_match_history(profile_ids: [-1]) }
              .to raise_error(RelicLink::Coh3::Api::Errors::UnknownProfileIds)
          end
        end
      end

      context 'when profile IDs provided are of an incorrect format' do
        it 'returns an error' do
          VCR.use_cassette('recent_match_history_profile_ids_error_format') do
            expect { client.recent_match_history(profile_ids: ['butts']) }
              .to raise_error(RelicLink::Errors::BadRequestError)
          end
        end
      end

      it 'queries with aliases' do
        VCR.use_cassette('recent_match_history_aliases') do
          body = client.recent_match_history(aliases: %w[Inverse])
          expect(body.dig('result', 'code')).to be_zero
          expect(body['matchHistoryStats']).not_to be_empty
        end
      end

      context 'when aliases provided are not valid' do
        it 'returns an error' do
          VCR.use_cassette('recent_match_history_aliases_error') do
            expect { client.recent_match_history(aliases: %w[SomeDudeWhoProbablyDefsDoesntExist]) }
              .to raise_error(RelicLink::Coh3::Api::Errors::UnknownAliases)
          end
        end
      end

      context 'when aliases provided are of an incorrect format' do
        it 'returns an error' do
          VCR.use_cassette('recent_match_history_aliases_error_format') do
            expect { client.recent_match_history(aliases: [-1]) }
              .to raise_error(RelicLink::Coh3::Api::Errors::UnknownAliases)
          end
        end
      end

      it 'queries with Steam IDs' do
        VCR.use_cassette('recent_match_history_steam_ids') do
          body = client.recent_match_history(profile_names: %w[/steam/76561197999799366])
          expect(body.dig('result', 'code')).to be_zero
          expect(body['matchHistoryStats']).not_to be_empty
        end
      end

      context 'when Steam IDs provided are not valid' do
        it 'returns an error' do
          VCR.use_cassette('recent_match_history_steam_ids_error') do
            expect { client.recent_match_history(profile_names: %w[/steam/-1]) }
              .to raise_error(RelicLink::Coh3::Api::Errors::UnregisteredProfileName)
          end
        end
      end

      context 'when Steam IDs provided are of an incorrect format' do
        it 'returns an error' do
          VCR.use_cassette('recent_match_history_steam_ids_error_format') do
            expect { client.recent_match_history(profile_names: [-1]) }
              .to raise_error(RelicLink::Errors::BadRequestError)
          end
        end
      end
    end

    describe '.recent_match_history_by_profile_id' do
      it 'queries with profile ID' do
        VCR.use_cassette('recent_match_history_by_profile_id') do
          body = client.recent_match_history_by_profile_id(8230)
          expect(body.dig('result', 'code')).to be_zero
          expect(body['matchHistoryStats']).not_to be_empty
        end
      end

      context 'when profile ID provided is not valid' do
        it 'returns an empty result' do
          VCR.use_cassette('recent_match_history_by_profile_id_empty') do
            body = client.recent_match_history_by_profile_id(-1)
            expect(body.dig('result', 'code')).to be_zero
            expect(body['matchHistoryStats']).to be_empty
          end
        end
      end

      context 'when profile ID provided is of an incorrect format' do
        it 'raises a bad request error' do
          VCR.use_cassette('recent_match_history_by_profile_id_error') do
            expect { client.recent_match_history_by_profile_id('butts') }
              .to raise_error(RelicLink::Errors::BadRequestError)
          end
        end
      end
    end

    describe '.available_leaderboards' do
      it 'queries available leaderboards' do
        VCR.use_cassette('available_leaderboards') do
          body = client.available_leaderboards
          expect(body.dig('result', 'code')).to be_zero
          expect(body['leaderboards']).not_to be_empty
          expect(body['matchTypes']).not_to be_empty
          expect(body['races']).not_to be_empty
          expect(body['factions']).not_to be_empty
          expect(body['leaderboardRegions']).not_to be_empty
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

          context 'with filters' do
            let(:count) { 100 }
            let(:start) { 1 }
            let(:sort_by) { RelicLink::Coh3::Api::Endpoints::Leaderboards::Sort::ELO }
            let(:body) { client.leaderboard(leaderboard_id:, count:, start:, sort_by:) }

            it "queries #{constant} with additional filters" do
              VCR.use_cassette("leaderboard_#{constant.to_s.downcase}_filtered") do
                expect(body.dig('result', 'code')).to be_zero
              end
            end

            context 'when a too small count is provided' do
              let(:count) { -1 }

              it 'raises an error' do
                VCR.use_cassette("leaderboard_#{constant.to_s.downcase}_count_small") do
                  expect { body }.to raise_error(RelicLink::Errors::BadRequestError)
                end
              end
            end

            context 'when a too large count is provided' do
              let(:count) { 9999 }

              it 'raises an error' do
                VCR.use_cassette("leaderboard_#{constant.to_s.downcase}_count_large") do
                  expect { body }.to raise_error(RelicLink::Errors::BadRequestError)
                end
              end
            end

            context 'when a too small start is provided' do
              let(:start) { -1 }

              it 'raises an error' do
                VCR.use_cassette("leaderboard_#{constant.to_s.downcase}_start_small") do
                  expect { body }.to raise_error(RelicLink::Errors::BadRequestError)
                end
              end
            end

            context 'when a too large start is provided' do
              let(:start) { 999_999_999_999_999_999_999_999_999 }

              it 'raises an error' do
                VCR.use_cassette("leaderboard_#{constant.to_s.downcase}_start_large") do
                  expect { body }.to raise_error(RelicLink::Errors::BadRequestError)
                end
              end
            end

            context 'when an invalid sort is provided' do
              let(:sort_by) { -1 }

              it 'raises an error' do
                VCR.use_cassette("leaderboard_#{constant.to_s.downcase}_sort_by_invalid") do
                  expect { body }.to raise_error(RelicLink::Errors::BadRequestError)
                end
              end
            end
          end
        end
      end

      context 'when leaderboard ID is invalid' do
        it 'raises an error' do
          VCR.use_cassette('leaderboard_id_invalid') do
            expect { client.leaderboard(leaderboard_id: -1) }.to raise_error(RelicLink::Coh3::Api::Errors::NotFound)
          end
        end
      end

      context 'when leaderboard ID is of an incorrect format' do
        it 'raises an error' do
          VCR.use_cassette('leaderboard_id_format_error') do
            expect { client.leaderboard(leaderboard_id: 'butts') }.to raise_error(RelicLink::Errors::BadRequestError)
          end
        end
      end
    end

    describe '.replay_url' do
      subject(:response) { client.replay_url(token:, path:) }

      let(:token) { 'z4h1rz7z7ttsam0q4ntwgew6asf3nr' }
      let(:path) do
        'replay_files_repo/coh3/profile_138410/8c5ac9dc4559011f69132a3969b9ced38bb9d19b5119e33e81336a65e6d0fe24'
      end

      it 'queries for a replay URL' do
        VCR.use_cassette('replay_url_valid') do
          expect(response[0]).to be_zero
          expect(response[1]).not_to be_nil
        end
      end

      context 'when token is missing' do
        let(:token) { nil }

        it 'raises an argument error' do
          expect { response }.to raise_error(ArgumentError)
        end
      end

      context 'when path is missing' do
        let(:path) { nil }

        it 'raises an argument error' do
          expect { response }.to raise_error(ArgumentError)
        end
      end

      context 'when all params are missing' do
        subject(:response) { client.replay_url }

        it 'raises an argument error' do
          expect { response }.to raise_error(ArgumentError)
        end
      end

      context 'when token is invalid' do
        let(:token) { 'nonsense' }

        it 'raises an unauthorized error' do
          VCR.use_cassette('replay_url_unauthorized') do
            expect { response }.to raise_error(RelicLink::Errors::UnauthorizedError)
          end
        end
      end

      context 'when path has expired' do
        let(:path) do
          'replay_files_repo/coh3/profile_43362/f440f6f2106d2ef897e2dcba4748301d80c2416f0752cb746da5ad3f10f20169'
        end

        it 'raises an expired path error' do
          VCR.use_cassette('replay_url_expired') do
            expect { response }.to raise_error(RelicLink::Coh3::Api::Errors::ExpiredPath)
          end
        end
      end

      context 'when path does not exist' do
        let(:path) { 'nonsense' }

        it 'raises an expired path error' do
          VCR.use_cassette('replay_url_missing_path') do
            expect { response }.to raise_error(RelicLink::Coh3::Api::Errors::ExpiredPath)
          end
        end
      end
    end
  end
end
