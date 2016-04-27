class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
    	t.references :post
    	t.references :user
    	t.text :reply

      t.timestamps
    end
  end
  def down
  	drop_table :comments
end
end
