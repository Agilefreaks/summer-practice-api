# frozen_string_literal: true

require_relative 'spec_helper'

Api::Container.start :persistence

Dir[SPEC_ROOT.join('support/db/*.rb').to_s].sort.each { |path| require(path) }

RSpec.configure do |config|
  config.include Test::Database::Helpers, type: :db

  config.before(type: :db) { DbCleaner.transaction_start }
  config.append_after(type: :db) { DbCleaner.transaction_clean }
end
