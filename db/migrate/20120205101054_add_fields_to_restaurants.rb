class AddFieldsToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :phone, :string
    add_column :restaurants, :url, :string
    add_column :restaurants, :address, :text
    add_column :d_restaurants, :phone, :string
    add_column :d_restaurants, :url, :string
    add_column :d_restaurants, :address, :text
  end
end
