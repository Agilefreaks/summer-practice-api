# frozen_string_literal: true

require 'api/repository'
require 'api/users/entities/user'

module Api
  module Users
    module Repositories
      class User < Api::Repository[:users]
        def create(params)
          Try { users.command(:create).call(params) }
            .fmap { |created_user| Entities::User.new(created_user) }
        end

        def update(user_id, params)
          Try { users.by_pk(user_id).command(:update).call(params) }
            .fmap { |updated_user| Entities::User.new(updated_user) }
        end

        def exists?(id)
          Try { users.by_pk(id).first }.to_maybe
        end
      end
    end
  end
end
