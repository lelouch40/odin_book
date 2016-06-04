class AddDateToUser < ActiveRecord::Migration
  def change
    add_column :users, :country, :string
    add_column :users, :about, :text
    add_column :users, :profession, :string
    add_column :users, :gender, :string
    add_column :users, :birthday, :datetime
  end
end
