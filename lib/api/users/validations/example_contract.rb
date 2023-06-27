# frozen_string_literal: true

require 'api/contract'
require 'api/import'

module Api
  module Users
    module Validations
      class ExampleContract < Api::Contract
        params do
          required(:example).filled(:string)
        end
      end
    end
  end
end
