# frozen_string_literal: true

require 'api/transaction'

module Api
  module Users
    module Transactions
      class Filter < Api::Transaction
        include Filtering

        validate :validate, with: 'users.validations.filter_contract'

        step :get_all, with: 'users.operations.get_all'
      end
    end
  end
end
