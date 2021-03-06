class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	validates_presence_of :description
		validates_presence_of :user_id
   scope :subscribed, ->(followers) { where user_id: followers }
     acts_as_likeable
end
