# frozen_string_literal: true

module Persistence
  module Commands
    # rubocop:disable Style/ClassAndModuleChildren
    class ROM::SQL::Commands::Update
      use :timestamps, timestamps: :updated_at, datestamps: :written
    end
    # rubocop:enable Style/ClassAndModuleChildren
  end
end
