# frozen_string_literal: true

namespace :db do
  namespace :structure do
    desc "Dump database structure to #{Database.structure_path}"
    task dump: :environment do
      system("pg_dump --schema-only --no-privileges --no-owner #{Database.name}", out: Database.structure_path)
    end
  end
end
