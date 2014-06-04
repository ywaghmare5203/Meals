class RemovePriceFromMealDMeal < ActiveRecord::Migration
  def up
    remove_column :meals, :price
    remove_column :d_meals, :price
  end

  def down
    add_column :meals, :price
    add_column :d_meals, :price
  end
end
