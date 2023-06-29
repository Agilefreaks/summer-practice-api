# frozen_string_literal: true

# auto_register: false

require 'dry/effects'
require 'url_helpers'

module Api
  module Serializers
    class UserSerializer
      include FastJsonapi::ObjectSerializer
      attributes :first_name, :last_name, :email, :avatar_url, :age

      link(:self) { |object| UrlHelpers.route_for(:user, id: object.id) }
    end
  end
end
