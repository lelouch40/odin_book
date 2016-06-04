class Photo < ActiveRecord::Base
	belongs_to :gallery
	belongs_to :user
		  mount_uploader :photo, PhotoUploader
		  	      validates_presence_of   :photo
end
