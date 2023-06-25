# frozen_string_literal: true

namespace :db do
  desc 'Load seed data into the database'
  task :seed do
    load(Database.seed_path)
  end
end
