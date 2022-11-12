class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable, :confirmable

  enum role:   %i[admin author],        _default: "author"
  enum status: %i[blocked not_blocked], _default: "not_blocked"
end
