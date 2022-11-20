users = []
3.times do
  users << { email: Faker::Internet.unique.email, first_name: Faker::Internet.username, 
             last_name: Faker::Internet.username, password: Faker::Internet.password(min_length: 8) }
end

User.insert_all(articles)

categories = []
3.times do
  categories << { name: Faker::Team.state }
end

Category.insert_all(categories)

user_ids = User.all.ids
category_ids = Category.all.ids

articles = []
3.times do
  articles << { title: Faker::Team.name, description: Faker::Team.state, 
    author_id: user_ids.sample, category_id: category_ids.sample }
end

Article.insert_all(articles)
