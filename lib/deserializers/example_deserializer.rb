# frozen_string_literal: true

# auto_register: false

require 'jsonapi/deserializable'

module Api
  module Deserializers
    class ExampleDeserializer < JSONAPI::Deserializable::Resource
      attributes
    end
  end
end
