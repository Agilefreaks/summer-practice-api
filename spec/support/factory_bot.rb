# frozen_string_literal: true

require 'factory_bot'

FactoryBot.definition_file_paths = %w[spec/factories/entities spec/factories/values]

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    require 'faker'
    FactoryBot.find_definitions
  end
end
