# frozen_string_literal: true

# auto_register: false

require 'dry/monads/try'
require 'dry/transaction/operation'

module Api
  class Operation
    def self.inherited(subclass)
      super
      subclass.include Dry::Transaction::Operation
      subclass.include Dry::Monads::Try::Mixin
    end
  end
end
