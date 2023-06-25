# frozen_string_literal: true

require 'vcr'

VCR.configure do |config|
  config.hook_into :webmock
  config.cassette_library_dir = 'features/cassettes'

  config.default_cassette_options = {
    match_requests_on: %i[method path body],
    allow_playback_repeats: true
  }
end
