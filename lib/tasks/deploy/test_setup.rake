# frozen_string_literal: true

namespace :deploy do
  desc 'Setup for test environment (meant to be run on CI)'
  task :test_setup do
    Rake::Task['routes:generate'].execute
  end
end
