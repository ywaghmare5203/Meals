class AddMealInfoToMealAndDMeal < ActiveRecord::Migration
  def change
    add_column :meals, :meal_info, :text
    add_column :d_meals, :meal_info, :text
  end
end
