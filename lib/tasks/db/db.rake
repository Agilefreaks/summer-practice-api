# frozen_string_literal: true

require 'rom/sql/rake_task'
require_relative '../helpers/database'

namespace :db do
  task :setup do
    Api::Container.init :persistence
  end
end
