class AddPricesToMeal < ActiveRecord::Migration
  def change
    add_column :meals, :price, :float
    add_column :d_meals, :price, :float
  end
end
