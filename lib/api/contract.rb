# frozen_string_literal: true

# auto_register: false

require 'dry-validation'
require 'api/import'

module Api
  class Contract < Dry::Validation::Contract
    config.messages.default_locale = :en
    config.messages.top_namespace = 'api'
    config.messages.load_paths << 'system/locals/en.yml'
  end
end
