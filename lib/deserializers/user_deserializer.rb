# frozen_string_literal: true

# auto_register: false

require 'jsonapi/deserializable'

module Api
  module Deserializers
    class UserDeserializer < JSONAPI::Deserializable::Resource
      attributes :first_name
      attributes :last_name
      attributes :email
      attributes :age
    end
  end
end
