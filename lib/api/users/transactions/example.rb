# frozen_string_literal: true

require 'api/transaction'

module Api
  module Users
    module Transactions
      class Example < Api::Transaction
        validate :validation, with: 'users.validations.example_contract'

        step :example, with: 'users.operations.example'
      end
    end
  end
end
