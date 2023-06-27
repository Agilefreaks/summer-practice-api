# frozen_string_literal: true

require 'api/repository'
require 'api/users/entities/user'

module Api
  module Users
    module Repositories
      class User < Api::Repository[:users]
        def example(id)
          Try { root.by_pk(id).one }
            .fmap { |user| Entities::User.new(user) }
        end
      end
    end
  end
end
