# frozen_string_literal: true

require 'api/contract'
require 'api/import'

module Api
  module Users
    module Validations
      class UpdateContract < Api::Contract
        include Import[user_repository: 'users.repositories.user']

        params do
          required(:user_id).filled(:integer)

          optional(:first_name).filled(:string)
          optional(:last_name).filled(:string)
          optional(:email).filled(:string)
          optional(:avatar_url).filled(:string)
          optional(:age).filled(:integer)
        end

        rule :user_id
          user_repository.exists?(value).or { key.failure("Missing user") }
        end
      end
    end
  end
end
