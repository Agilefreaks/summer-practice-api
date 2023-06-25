# frozen_string_literal: true

require 'api/contract'

module Api
  module Users
    module Validations
      class UpdateContract < Api::Contract
        include Import[user_repository: 'users.repositories.user']

        params do
          required(:user_id).filled(:integer)
        end

        rule(:user_id) do
          user_repository.find_by_id(value).or { key.failure(:exists) }
        end
      end
    end
  end
end
