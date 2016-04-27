class AddUserAvatar < ActiveRecord::Migration
  def change
  	  	add_column :users, :avatar, :string
          	  	remove_column :users, :avatar_url, :string

  end
end
