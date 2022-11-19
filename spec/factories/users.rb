FactoryBot.define do
  factory :user do
    first_name { "UserFirstName" }
    last_name { "UserLastName" }
    sequence(:email)  { |n| "usessr-#{n}@gmail.com" }
    password { 123456 }
    password_confirmation { 123456 }
  end
end
