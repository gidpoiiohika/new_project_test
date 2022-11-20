# frozen_string_literal: true

FactoryBot.define do
  factory :article, class: Article do
    title { Faker::JapaneseMedia::DragonBall.character }
    description { Faker::JapaneseMedia::DragonBall.race }
    author_id { create(:user).id }
    category_id { create(:category).id }
  end
end
