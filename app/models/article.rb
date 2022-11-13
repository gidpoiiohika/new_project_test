class Article < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :category
  
  has_many :tags
  has_many :comments, through: :author

  validates :title, presence: true
  validates :description, presence: true

  enum status: %i[published hidden], _default: "published"

  STATUS = %w{ published hidden }

  STATUS.each do |status_article|
    define_method "#{status_article}?" do 
      status == status_article  
    end
  end
end
