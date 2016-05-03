class CreateOtherfriendships < ActiveRecord::Migration
  def change
    create_table :otherfriendships do |t|
    	    	t.integer :user_id
    	t.integer :friended_id

      t.timestamps null: false
    end
  end
  def down
  drop_table :otherfriendships
end
end
