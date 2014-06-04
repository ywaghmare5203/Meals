class CreateDRestaurants < ActiveRecord::Migration
  def change
    create_table :d_restaurants do |t|
      t.string :name
      t.text :description
      t.float :lat
      t.float :lng
      t.integer :admin_id
      t.text :delivery_area
      t.integer :status
      t.integer :cuisine_id

      t.timestamps
    end
  end
end
