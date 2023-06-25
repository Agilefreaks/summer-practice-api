# frozen_string_literal: true

require 'api/contract'

module Api
  module Users
    module Validations
      class DeleteContract < Api::Contract
        params do
          required(:id).value(:integer)
        end
      end
    end
  end
end
