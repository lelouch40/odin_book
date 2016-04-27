class Post < ActiveRecord::Base
	belongs_to :users
	has_many :comments
	validates_presence_of :description
	
end
