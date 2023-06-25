# frozen_string_literal: true

require 'platform-api'

namespace :deploy do
  desc 'This task will setup HOST_URL environment variable as https://<heroku_app_name>.herokuapp.com'
  namespace :preview do
    task :set_host_url do
      if preview_environment?
        PlatformAPI
          .connect_oauth(ENV['HEROKU_API_TOKEN'])
          .config_var
          .update(
            ENV['HEROKU_APP_NAME'],
            'HOST_URL' => "https://#{ENV['HEROKU_APP_NAME']}.herokuapp.com"
          )
      end
    end
  end
end
