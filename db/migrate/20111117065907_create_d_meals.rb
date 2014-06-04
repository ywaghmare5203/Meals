class CreateDMeals < ActiveRecord::Migration
  def change
    create_table :d_meals do |t|
      t.string :name
      t.text :description
      t.integer :restaurant_id
      t.float :price
      t.integer :cuisine_id
      t.integer :spicy

      t.timestamps
    end
  end
end
