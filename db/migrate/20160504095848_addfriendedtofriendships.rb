class Addfriendedtofriendships < ActiveRecord::Migration
  def change
  	  	 add_column :friendships, :friended_id, :integer
  end
end
