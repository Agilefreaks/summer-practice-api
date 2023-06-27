# frozen_string_literal: true

module Api
  class Web
    route 'v1/example' do |route|
      controller_name = 'example.controller'

      route.is do
        # route[example]: GET /v1/example
        route.get do
          resolve route, controller_name do |controller|
            controller.example(route.params)
          end
        end
      end

      route.on Integer do |user_id|
        route.is do
          # route[create_example]: GET /v1/example/:id
        end
      end
    end
  end
end
