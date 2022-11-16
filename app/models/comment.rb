class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  scope :sort_comment, -> { order(rating: :desc).limit(25) }
end
