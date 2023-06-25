# frozen_string_literal: true

require 'api/transaction'

module Api
  module Users
    module Transactions
      class Delete < Api::Transaction
        validate :validation, with: 'users.validations.delete_contract'

        step :delete, with: 'users.operations.delete'
      end
    end
  end
end
