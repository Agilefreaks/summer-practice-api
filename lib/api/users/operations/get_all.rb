# frozen_string_literal: true

require 'api/operation'
require 'api/import'

module Api
  module Users
    module Operations
      class GetAll < Api::Operation
        include Import[user_repository: 'users.repositories.user']

        def call(params)
          user_repository.filter(params)
        end
      end
    end
  end
end
