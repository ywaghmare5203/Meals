class AddOrigIdToDRestaurant < ActiveRecord::Migration
  def change
    add_column :d_restaurants, :restaurant_id, :integer
  end
end
