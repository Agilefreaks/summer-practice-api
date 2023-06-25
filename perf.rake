# frozen_string_literal: true

require 'bundler'
Bundler.setup

require 'derailed_benchmarks'
require 'derailed_benchmarks/tasks'
require_relative 'system/boot'

namespace :perf do
  task :rack_load do
    const_set(DERAILED_APP, Api::Web.app)
  end
end
