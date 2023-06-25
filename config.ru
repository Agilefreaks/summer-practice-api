# frozen_string_literal: true

require 'rack/cors'

use Rack::Cors do
  allow do
    origins '*'
    resource '*', headers: :any, methods: :any
  end
end

require_relative 'system/boot'

run Api::Web.freeze.app
