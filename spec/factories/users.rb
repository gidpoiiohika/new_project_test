# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { 'UserFirstName' }
    last_name { 'UserLastName' }
    sequence(:email) { |n| "usessr-#{n}@gmail.com" }
    password { 123_456 }
    password_confirmation { 123_456 }
  end
end
