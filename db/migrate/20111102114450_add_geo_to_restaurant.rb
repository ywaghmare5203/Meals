class AddGeoToRestaurant < ActiveRecord::Migration
  def change

    # remove_column :restaurants, :city_id

    add_column :restaurants, :delivery_area, :text
  end
end
