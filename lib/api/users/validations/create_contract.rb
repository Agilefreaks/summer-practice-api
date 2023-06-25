# frozen_string_literal: true

require 'api/contract'
require 'api/import'

module Api
  module Users
    module Validations
      class CreateContract < Api::Contract
        params do
          required(:first_name).filled(:string)
          required(:last_name).filled(:string)
          required(:email).filled(:string)
          required(:age).filled(:integer)
        end
      end
    end
  end
end
