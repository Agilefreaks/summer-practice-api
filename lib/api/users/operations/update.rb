# frozen_string_literal: true

require 'api/operation'
require 'api/import'

module Api
  module Users
    module Operations
      class Update < Api::Operation
        include Import[user_repository: 'users.repositories.user']

        def call(fields)
          user_repository.update(fields[:user_id], fields).to_result(:forbidden)
        end
      end
    end
  end
end
