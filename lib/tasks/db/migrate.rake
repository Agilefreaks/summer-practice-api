# frozen_string_literal: true

namespace :db do
  desc 'Migrate database up to latest migration available'
  task migrate: :environment do
    Rake::Task['db:structure:dump'].execute unless production_environment?
  end
end
