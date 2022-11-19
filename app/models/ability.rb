# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    if user.admin?
      can :manage, :all
    else
      can [:update, :destroy], Article, author: user
      can [:index, :show, :create], Article

      can [:index], Category

      can [:show, :create, :ratings], Comment
    end
  end
end
