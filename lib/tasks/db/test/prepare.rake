# frozen_string_literal: true

namespace :db do
  namespace :test do
    desc 'It will setup the test database'
    task prepare: :environment do
      raise 'You need to be in test environment' unless ENV['RACK_ENV'] == 'test'

      Rake::Task['db:drop'].execute
      Rake::Task['db:create'].execute

      Rake::Task['db:structure:load'].execute
      Rake::Task['db:seed'].execute
    end
  end
end
