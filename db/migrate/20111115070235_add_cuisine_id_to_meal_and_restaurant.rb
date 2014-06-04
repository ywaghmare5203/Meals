class AddCuisineIdToMealAndRestaurant < ActiveRecord::Migration
  def change
    add_column :meals, :cuisine_id, :integer
    add_column :restaurants, :cuisine_id, :integer
  end
end
