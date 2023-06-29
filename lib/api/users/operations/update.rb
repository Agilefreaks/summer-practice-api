# frozen_string_literal: true

require 'api/operation'
require 'api/import'

module Api
  module Users
    module Operations
      class Update < Api::Operation
        include Import[user_repository: 'users.repositories.user']

        def call(params)
          user_id = params.delete(:user_id)
          user_repository.update(user_id, params)
        end
      end
    end
  end
end
