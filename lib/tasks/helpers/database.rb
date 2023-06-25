# frozen_string_literal: true

module Database
  SEED_PATH = 'db/seed.rb'
  STRUCTURE_PATH = 'db/structure.sql'
  SAMPLE_DATA_PATH = 'db/sample_data.rb'

  class << self
    def host
      uri.hostname
    end

    def port
      uri.port
    end

    def name
      uri.path.tr('/', '')
    end

    def user
      uri.user
    end

    def password
      uri.password
    end

    def structure_path
      STRUCTURE_PATH
    end

    def seed_path
      SEED_PATH
    end

    def sample_data_path
      SAMPLE_DATA_PATH
    end

    def run_migration
      gateway.migration do
        change do
          yield(self)
        end
      end.apply(gateway.connection, :up)
    end

    private

    def gateway
      ROM.container(:sql, settings.database_url).gateways[:default]
    end

    def uri
      @uri ||= URI.parse(settings.database_url)
    end
  end
end
