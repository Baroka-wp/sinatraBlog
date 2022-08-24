class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    user ||= User.new # guest user (not logged in)
    can :read, :all
    if user.admin?
      can :manage, :all
      can :access, :rails_admin
    else
      can :manage, Post, user_id: user.id
      can :manage, Comment, user_id: user.id
      can :read, User, id: user.id
    end
  end
end
