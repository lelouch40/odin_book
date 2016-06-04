class Ability
  include CanCan::Ability
  def initialize(user)
  	    user ||= User.new 
  	    # guest user
  	if user.admin?
  	 can :manage,:all
else
can :manage, Post, :user_id => user.id
can :manage, Photo, :user_id => user.id
can :manage, User, user == :current_user
can :read, :all
    #can [:delete], Post, user.id=>user_id
  end
end
end
