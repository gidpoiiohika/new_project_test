class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :validatable, :confirmable, :jwt_authenticatable, jwt_revocation_strategy: self

  enum role:   %i[admin author],        _default: "author"
  enum status: %i[blocked not_blocked], _default: "not_blocked"

  def jwt_payload
    super
  end
end
