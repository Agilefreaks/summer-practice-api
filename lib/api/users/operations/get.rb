# frozen_string_literal: true

require 'api/operation'
require 'api/import'

module Api
  module Users
    module Operations
      class Get < Api::Operation
        include Import[user_repository: 'users.repositories.user']

        def call(user_id)
          user_repository.find_by_id(user_id).to_result(:not_found)
        end
      end
    end
  end
end
