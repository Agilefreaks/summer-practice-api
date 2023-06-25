# frozen_string_literal: true

# auto_register: false

require 'dry/monads'
require 'rom-repository'
require 'api/container'
require 'api/import'

module Api
  class Repository < ROM::Repository::Root
    include Dry::Monads[:maybe, :try]

    include Import[container: 'persistence.rom']
  end
end
