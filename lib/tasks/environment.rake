# frozen_string_literal: true

task :environment do
  setup_database_environment
end

def setup_database_environment
  ENV['PGHOST'] = Database.host
  ENV['PGPORT'] = Database.port.to_s
  ENV['PGUSER'] = Database.user
end
