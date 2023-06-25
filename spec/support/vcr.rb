# frozen_string_literal: true

require 'vcr'

module Test
  module Request
    module MockConfig
      WebMock.disable_net_connect!

      VCR.configure do |config|
        config.hook_into :webmock
        config.cassette_library_dir = 'spec/cassettes'
        config.default_cassette_options = { match_requests_on: %i[method path], allow_playback_repeats: true }
      end
    end
  end
end
