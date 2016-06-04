class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
    	t.references :user
    	t.references :photo

      t.timestamps
    end
  end
end
