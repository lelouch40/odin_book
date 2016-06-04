class Addphototogallery < ActiveRecord::Migration
  def change
  	  	  add_column :galleries, :photo, :string
  	  	   add_column :photos, :photo, :string
  end
end
