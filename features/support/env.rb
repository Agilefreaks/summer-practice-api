# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'

SPEC_ROOT = Pathname(__FILE__).dirname
SHARED_DIR = SPEC_ROOT.join('../../shared')

require 'rack/test'

require_relative 'json_struct_spec'
require_relative 'web_helpers'
require_relative 'feature_helpers'

require SPEC_ROOT.join('../../system/boot')
require SPEC_ROOT.join('../../system/api/container')
require SPEC_ROOT.join('../../spec/support/db/factory')
require SPEC_ROOT.join('../../spec/support/db/db_cleaner')

Api::Container.start :persistence

Before do
  load File.join(SPEC_ROOT, '..', '..', 'db', 'seed.rb')
  require_relative 'setup_data'
  SetupData.call
end

Around do |_scenario, block|
  DbCleaner.truncation_cleaning(&block)
end

World(Rack::Test::Methods)
World(WebHelpers)
World(JSONStructSpec::Matchers)
World(FeatureHelpers)

WebHelpers.app.freeze
