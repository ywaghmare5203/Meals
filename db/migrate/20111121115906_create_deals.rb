class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.integer :d_meal_id
      t.integer :d_restaurant_id
      t.integer :threshold
      t.float :price
      t.integer :range
      t.integer :owner_id
      t.integer :admin_id

      t.timestamps
    end
  end
end
