# frozen_string_literal: true

namespace :db do
  desc 'Drop database'
  task drop: :environment do
    system("dropdb #{Database.name}")
  end
end
