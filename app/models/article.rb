class Article < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :category
  
  has_many :tags
  has_many :comments, through: :author

  validates :title, presence: true
  validates :description, presence: true

  enum status: %i[published hidden], _default: "published"

  scope :not_deleted, lambda { where(deleted_at: nil) }
  scope :deleted, lambda { where("#{self.table_name}.deleted_at IS NOT NULL") }

  STATUS = %w{ published hidden }

  STATUS.each do |status_article|
    define_method "#{status_article}?" do 
      status == status_article  
    end
  end

  def destroy
    self.update(deleted_at: DateTime.current)
  end

  def delete
    destroy
  end

  def deleted?
    self.deleted_at.present?
  end
end
