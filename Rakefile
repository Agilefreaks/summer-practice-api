# frozen_string_literal: true

require 'bundler/setup'
require_relative 'system/api/container'

def production_environment?
  ENV['RACK_ENV'] == 'production' || ENV['RACK_ENV'] == 'staging' || preview_environment?
end

def preview_environment?
  ENV['RACK_ENV'] == 'preview'
end

unless production_environment?
  require 'pry-byebug'

  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new :rspec

  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new :cucumber

  require 'rubocop/rake_task'
  RuboCop::RakeTask.new :rubocop

  require 'reek/rake/task'
  Reek::Rake::Task.new do |task|
    task.name = :reek
    task.config_file = '.reek.yml'
    task.source_files = '.'
  end

  desc 'Run all specs'
  task spec_all: %i[rubocop reek rspec cucumber]

  desc 'Runs spec_all rake task'
  task default: [:spec_all]
end

def settings
  Api::Container['settings']
end

Rake.add_rakelib('lib/tasks/**')
