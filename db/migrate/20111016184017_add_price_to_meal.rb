class AddPriceToMeal < ActiveRecord::Migration
  def change
    add_column :meals, :price, :float
  end
end
