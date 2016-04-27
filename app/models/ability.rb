class Ability
  include CanCan::Ability
  def initialize(user)
  	    user ||= User.new 
  	    # guest user
  	if user.admin?
  	 can :manage,:all
else
can :manage, Post, :user_id => user.id
    #can [:delete], Post, user.id=>user_id

  end
end
end
