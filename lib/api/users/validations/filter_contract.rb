# frozen_string_literal: true

require 'api/contract'

module Api
  module Users
    module Validations
      class FilterContract < Api::Contract
        params do
          optional(:filter_attributes).each(included_in?: %i[first_name])

          optional(:filter).hash do
            optional(:first_name).filled(:string)
          end
        end
      end
    end
  end
end
