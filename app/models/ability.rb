# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    else
      can %i[update destroy], Article, author: user
      can %i[index show create], Article

      can [:index], Category

      can %i[show create ratings], Comment
    end
  end
end
