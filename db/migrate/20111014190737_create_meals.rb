class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name
      t.text :description
      t.string :picture_url
      t.integer :restaurant_id
      t.boolean :fp_vegetarian

      t.timestamps
    end
  end
end
