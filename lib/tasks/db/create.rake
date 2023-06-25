# frozen_string_literal: true

namespace :db do
  desc 'Create database'
  task create: :environment do
    system("createdb #{Database.name}")
  end
end
