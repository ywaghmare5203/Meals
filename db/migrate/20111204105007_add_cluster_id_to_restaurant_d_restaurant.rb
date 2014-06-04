class AddClusterIdToRestaurantDRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :cluster_id, :integer
    add_column :d_restaurants, :cluster_id, :integer
  end
end
