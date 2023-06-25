# frozen_string_literal: true

require 'bundler/setup'

require 'pry-byebug' if ENV['RACK_ENV'] == 'development' || ENV['RACK_ENV'] == 'test'

require_relative 'api/container'

Api::Container.finalize!

require 'api/web'
