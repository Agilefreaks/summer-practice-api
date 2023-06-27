# frozen_string_literal: true

# auto_register: false

require 'dry/effects'
require 'url_helpers'

module Api
  module Serializers
    class ExampleSerializer
      include FastJsonapi::ObjectSerializer
      attributes :example

      link(:self) { |object| UrlHelpers.route_for(:example, id: object.id) }
    end
  end
end
