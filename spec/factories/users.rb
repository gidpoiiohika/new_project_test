# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Internet.username }
    last_name { Faker::Internet.username }
    email { Faker::Internet.free_email }
    password { 123_456 }
    password_confirmation { 123_456 }
  end
end
