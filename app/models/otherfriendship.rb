class Otherfriendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friended, class_name: 'User', foreign_key: 'friended_id'
end
