# frozen_string_literal: true

Factory.define :user do |user|
  user.first_name { fake(:name, :first_name) }
  user.last_name { fake(:name, :last_name) }
  user.email { fake(:internet, :email) }
  user.age { fake(:number, :number, digits: 2) }
end
