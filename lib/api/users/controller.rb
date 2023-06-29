# frozen_string_literal: true

require 'api/controller'

require 'serializers/user_serializer'
require 'deserializers/user_deserializer'

module Api
  module Users
    class Controller < Api::Controller
      include Import[create_transaction: 'users.transactions.create']
      include Import[update_transaction: 'users.transactions.update']

      def create(params)
        input = Deserializers::UserDeserializer.call(params['data'])
        create_transaction.call(input) do |transaction|
          transaction.success { |new_user| create_response(new_user) }
          handle(transaction)
        end
      end

      def update(id, params)
        input = Deserializers::UserDeserializer.call(params['data'])
        update_transaction.call(input.merge(user_id: id)) do |transaction|
          transaction.success { |updated_user| get_response(updated_user) }
          handle(transaction)
        end
      end

      private

      def create_response(data)
        json, status = serialize_response(Serializers::UserSerializer, data, { status: :created })
        build_response(json, status: status)
      end
      #
      def get_response(data)
        json, status = serialize_response(Serializers::UserSerializer, data)
        build_response(json, status: status)
      end
    end
  end
end
