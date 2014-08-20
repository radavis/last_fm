require 'rspec'
require 'vcr'
require_relative '../lib/last_fm'

LastFM.load_api_key_from_env

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.configure_rspec_metadata!
  c.default_cassette_options = { record: :new_episodes }
  c.filter_sensitive_data('<LASTFM API KEY>') { LastFM.api_key }
end
