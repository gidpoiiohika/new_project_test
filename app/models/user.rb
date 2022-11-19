class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  has_one_attached :avatar

  devise :database_authenticatable, :recoverable, :registerable, :validatable, 
          :confirmable, :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :articles, foreign_key: 'author_id'

  validates :first_name, presence: true
  validates :last_name, presence: true

  enum role:   %i[admin author],     _default: "author"
  enum status: %i[blocked unlocked], _default: "unlocked"

  ROLES = %w{ admin author }
  STATUS = %w{ blocked unlocked }

  ROLES.each do |role_name|
    define_method "#{role_name}?" do 
      role == role_name  
    end
  end

  STATUS.each do |status_user|
    define_method "#{status_user}?" do 
      status == status_user  
    end
  end

  def active_for_authentication?
    super and self.unlocked?
  end

  def jwt_payload
    super
  end

  private

  def send_devise_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_later(wait: 5.second)
  end
end
