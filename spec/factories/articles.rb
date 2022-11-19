FactoryBot.define do
  factory :article, class: Article do
    title { "title test" }
    description { "description test" }
    author_id { create(:user).id }
    category_id { create(:category).id  }
  end
end
