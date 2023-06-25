# frozen_string_literal: true

namespace :db do
  desc 'Load a small, representative set of data so that the application can start in a useful state (for development).'
  task :sample_data do
    load(Database.sample_data_path)
  end
end
