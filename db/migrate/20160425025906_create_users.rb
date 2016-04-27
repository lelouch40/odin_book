class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
     t.string :username
     t.references :post
     t.references :comment
      t.timestamps
    end
  end
end
