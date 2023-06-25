# frozen_string_literal: true

namespace :db do
  namespace :structure do
    desc "Load database structure from #{Database.structure_path}"
    task load: :environment do
      system("psql -d #{Database.name} -h #{Database.host} < #{Database.structure_path}")
    end
  end
end
