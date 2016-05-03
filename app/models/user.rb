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


  has_many :active_friend,         class_name:  "Friendship",
                                   foreign_key: "friend_id",
                                   dependent:   :destroy
  has_many :passive_friend,        class_name:  "Friendship",
                                   foreign_key: "user_id",
                                   dependent:   :destroy
  has_many :friends, through: :active_friend,  source: :friend, :class_name=> "User"
  has_many :friended, through: :passive_friend, source: :user, :class_name=> "User"



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

  def friend(other_user)
      friends.create(:friend_id => other_user.id)
    end
    def unfriend(other_user)
   passive_friend.find_by(friend_id: other_user.id) .destroy
    end
    def friends_with?(other_user)
    friends.include?(other_user)
  end
end