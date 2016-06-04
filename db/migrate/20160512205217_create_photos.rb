class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
    	 t.references :user
    	t.references :gallery

      t.timestamps
    end
  end
end
