# frozen_string_literal: true

require 'api/users/entities/user'

FactoryBot.define do
  factory :user, class: 'Api::Users::Entities::User' do
    id { 1 }

    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    avatar_url { Faker::Avatar.image }
    age { Faker::Number.number(digits: 2) }

    initialize_with { new(attributes) }
  end
end
