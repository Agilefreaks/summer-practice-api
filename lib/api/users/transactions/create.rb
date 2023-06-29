# frozen_string_literal: true

require 'api/transaction'

module Api
  module Users
    module Transactions
      class Create < Api::Transaction
        validate :validation, with: 'users.validations.create_contract'

        step :create, with: 'users.operations.create'
      end
    end
  end
end
