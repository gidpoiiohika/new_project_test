# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  validates :title, presence: true

  scope :sort_comment, -> { order(rating: :desc).limit(25) }
end
