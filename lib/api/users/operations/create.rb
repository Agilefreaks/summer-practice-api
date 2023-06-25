# frozen_string_literal: true

require 'api/operation'
require 'api/import'

module Api
  module Users
    module Operations
      class Create < Api::Operation
        include Import[user_repository: 'users.repositories.user']

        def call(new_user)
          user_repository.create(new_user).to_result
        end
      end
    end
  end
end
