class AddMealIdToDMeal < ActiveRecord::Migration
  def change
    add_column :d_meals, :meal_id, :integer
  end
end
