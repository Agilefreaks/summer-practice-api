# frozen_string_literal: true

namespace :routes do
  desc 'Generate app/routes.json file using web/routes/**/*.rb'
  task :generate do
    system('roda-parse_routes -f routes.json web/routes/**/*.rb')
  end
end
