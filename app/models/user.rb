class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :posts
         has_many :comments
  has_many :active_relationships,  class_name:  "Relationship",
                                   foreign_key: "follower_id",
                                   dependent:   :destroy
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower


  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user


    has_many :otherfriendships
  has_many :otherfriends, :through => :otherfriendships,  :source => :user
  has_many :inverse_otherfriendships, :class_name => "Friendship", :foreign_key => "friended_id"
  has_many :inverse_otherfriends, :through => :inverse_otherfriendships, :source => :user

has_many :requested_friendships, -> { where(friendships: { accepted: false}) }, :through => :passive_friend, :source => :user
has_many :pending_friends, -> { where(friendships: { accepted: false}) }, :through => :friended, :source => :friend

    acts_as_liker
   def admin?
    admin
  end
  mount_uploader :avatar, AvatarUploader
    #validates_presence_of   :avatar
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

        def not_follow(other_user)
    !following.include?(other_user)
  end


    def friends_with?(other_user,current)
    friends.include?(other_user)
    otherfriends.include?(current)
  end
end