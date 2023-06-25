# frozen_string_literal: true

require 'api/transaction'

module Api
  module Users
    module Transactions
      class Update < Api::Transaction
        validate :validation, with: 'users.validations.update_contract'

        step :update, with: 'users.operations.update'
      end
    end
  end
end
