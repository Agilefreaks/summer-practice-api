# frozen_string_literal: true

require 'api/repository'
require 'api/users/entities/user'

module Api
  module Users
    module Repositories
      class User < Api::Repository[:users]
        def find_by_id(id)
          Try { root.by_pk(id).one }
            .fmap { |user| Entities::User.new(user) }
            .to_maybe
        end

        def filter(params)
          Try { root.select(:id).with_filter(params[:filter] || {}).to_a }
            .fmap { |users| users.map { |user| find_by_id(user.id).value_or(nil) }.compact }
            .to_result
        end

        def create(new_user)
          Try { root.command(:create).call(new_user) }
            .bind { |created_user| find_by_id(created_user.id) }
            .to_maybe
        end

        def update(id, fields)
          Try { root.by_pk(id).command(:update).call(fields) }
            .bind { |user| find_by_id(user.id) }
            .to_maybe
        end

        def delete(id)
          Try { root.by_pk(id).command(:delete).call }
            .to_maybe
            .to_result(:not_found)
        end
      end
    end
  end
end
