# frozen_string_literal: true

module Api
  class Web
    route 'v1/users' do |route|
      controller_name = 'users.controller'

      route.is do
        # route[users]: GET /v1/users
        route.get do
          resolve route, controller_name do |controller|
            controller.index(route.params)
          end
        end

        # route[create_user]: POST /v1/users
        route.post do
          resolve route, controller_name do |controller|
            controller.create(route.params)
          end
        end
      end

      route.on Integer do |user_id|
        route.is do
          # route[user]: GET /v1/users/:id
          route.get do
            resolve route, controller_name do |controller|
              controller.show(user_id)
            end
          end

          # route[update_user]: PATCH /v1/users/:id
          route.patch do
            resolve route, controller_name do |controller|
              controller.update(user_id, route.params)
            end
          end

          # route[delete_user]: DELETE /v1/users/:id
          route.delete do
            resolve route, controller_name do |controller|
              controller.delete(user_id)
            end
          end
        end
      end
    end
  end
end
