class Gallery < ActiveRecord::Base
	has_many :photos,  :dependent => :destroy
	has_many :users
	  mount_uploader :photo, PhotoUploader
	      validates_presence_of   :photo
end
