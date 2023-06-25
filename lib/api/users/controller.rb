# frozen_string_literal: true

require 'api/controller'

require 'serializers/user_serializer'
require 'deserializers/user_deserializer'

module Api
  module Users
    class Controller < Api::Controller
      include Import[get_operation: 'users.operations.get']
      include Import[filter_transaction: 'users.transactions.filter']
      include Import[create_transaction: 'users.transactions.create']
      include Import[update_transaction: 'users.transactions.update']
      include Import[delete_transaction: 'users.transactions.delete']

      def index(params)
        filter_transaction.call(params) do |monad|
          monad.success { |users| get_response(users) }
          handle(monad)
        end
      end

      def show(user_id)
        get_operation.call(user_id) do |monad|
          monad.success { |user| get_response(user) }
          handle(monad)
        end
      end

      def create(params)
        create_transaction.call(Deserializers::UserDeserializer.call(params['data'])) do |monad|
          monad.success { |user| create_response(user) }
          handle(monad)
        end
      end

      def update(user_id, params)
        input = Deserializers::UserDeserializer.call(params['data'])

        update_transaction.call(input.merge(user_id: user_id)) do |monad|
          monad.success { |user| get_response(user) }
          handle(monad)
        end
      end

      def delete(user_id)
        delete_transaction.call(id: user_id) do |monad|
          monad.success { |_| build_response(nil, status: :no_content) }
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
