# frozen_string_literal: true

# auto_register: false

require 'jsonapi/deserializable'

module Api
  module Deserializers
    class UserDeserializer < JSONAPI::Deserializable::Resource
      attributes :first_name, :last_name, :email, :avatar_url, :age
    end
  end
end
