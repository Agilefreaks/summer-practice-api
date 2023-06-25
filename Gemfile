# frozen_string_literal: true

ruby '3.0.1'
source 'https://rubygems.org'

gem 'rake', '~> 13.0.3'

# Web framework
gem 'dry-system', '~> 0.17'
gem 'dry-web', '~> 0.8'
gem 'dry-web-roda', '~> 0.13'

# Web server
gem 'puma', '~> 5.6'
gem 'rack', '>= 2.0'
gem 'rack-cors', require: 'rack/cors'

# Application dependencies

gem 'dry-effects', '~> 0.1.5'
gem 'dry-monads', '~> 1.3'
gem 'dry-struct', '~> 1.3'
gem 'dry-transaction', '~> 0.13.2'
gem 'dry-transformer', '~> 0.1'
gem 'dry-types', '~> 1.3'
gem 'dry-validation', '~> 1.5.0'
gem 'dry-view', '~> 0.7.1'
gem 'erbse', '~> 0.1.4'
gem 'i18n', '~> 1.8'
gem 'jsonapi-deserializable', '~> 0.2'
gem 'jsonapi-serializer', '~> 2.1'
gem 'platform-api', '~> 3.0'
gem 'roda-route_list', '~> 2.0'

# Database persistence
gem 'pg', '~> 1.2'
gem 'rom', '~> 5.1'
gem 'rom-sql', '~> 3.1'
gem 'sequel_pg', '~> 1.13'

group :development, :test do
  gem 'derailed', '~> 0.1'
  gem 'derailed_benchmarks', '~> 1.8'
  gem 'guard-reek', '~> 1.2'
  gem 'guard-rspec', '~> 4.7', require: false
  gem 'guard-rubocop', '~> 1.3'
  gem 'pry-byebug', platform: :mri
  gem 'reek', '~> 6.0'
  gem 'rerun', '~> 0.13'
  gem 'rubocop', '~> 0.80'
  gem 'rubocop-md', '~> 0.4.0'
  gem 'rubocop-performance', '~> 1.5'
  gem 'rubocop-rspec', '~> 1.38'
  gem 'stackprof', '~> 0.2'
  gem 'timecop', '~> 0.9'
end

group :test do
  gem 'cucumber', '~> 5.1'
  gem 'database_cleaner-sequel', '~> 2.0'
  gem 'factory_bot', '~> 6.1'
  gem 'rack-test', '~> 1.1'
  gem 'rom-factory', '~> 0.10'
  gem 'rspec', '~> 3.9'
  gem 'rspec-its', '~> 1.2'
  gem 'vcr', '~> 6.0'
  gem 'webmock', '~> 3.10'
end
