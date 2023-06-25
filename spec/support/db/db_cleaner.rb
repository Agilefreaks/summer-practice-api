# frozen_string_literal: true

require 'database_cleaner-sequel'
require_relative 'helpers'

class DbCleaner
  class << self
    def truncation_cleaning(&block)
      cleaner(:truncation).cleaning(&block)
    end

    def transaction_start
      cleaner(:transaction).start
    end

    def transaction_clean
      cleaner(:transaction).clean
    end

    private

    def cleaner(strategy)
      @cleaner ||= DatabaseCleaner[:sequel, db: Test::Database::Helpers.db].tap { |db_cleaner| db_cleaner.strategy = strategy }
    end
  end
end
