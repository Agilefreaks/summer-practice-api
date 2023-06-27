# frozen_string_literal: true

require 'api/controller'

require 'serializers/user_serializer'
require 'deserializers/user_deserializer'

module Api
  module Users
    class Controller < Api::Controller
      include Import[example_transaction: 'users.transactions.example']

      def example(params)
        example_transaction.call(params) do |monad|
          monad.success { |users| get_response(users) || create_response(users) }
          handle(monad)
        end
      end

      private

      def create_response(data)
        json, status = serialize_response(Serializers::UserSerializer, data, { status: :created })
        build_response(json, status: status)
      end

      def get_response(data)
        json, status = serialize_response(Serializers::UserSerializer, data)
        build_response(json, status: status)
      end
    end
  end
end
