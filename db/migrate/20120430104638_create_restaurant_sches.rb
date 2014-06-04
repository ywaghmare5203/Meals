class CreateRestaurantSches < ActiveRecord::Migration
  def change
    create_table :restaurant_sches do |t|
      t.integer :res_id
      t.integer :quantity
      t.integer :dish_id
      t.integer :status
      t.datetime :date
      t.timestamps
    end
  end
end
