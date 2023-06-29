# frozen_string_literal: true

module Api
  class Web
    route 'v1/users' do |route|
      controller_name = 'users.controller'

      route.is do
        # route[create_user]: GET /v1/users
        route.post do
          resolve route, controller_name do |controller|
            controller.create(route.params)
          end
        end
      end

      route.on Integer do |id|
        route.is do
          # route[update_user]: GET /v1/example/:id
          route.patch do
            resolve route, controller_name do |controller|
              controller.update(id, route.params)
            end
          end
        end
      end
    end
  end
end
