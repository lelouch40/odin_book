class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.string :description
    	t.references :user
    	t.references :comment

      t.timestamps
    end
  end
end
