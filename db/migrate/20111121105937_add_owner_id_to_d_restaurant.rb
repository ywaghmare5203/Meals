class AddOwnerIdToDRestaurant < ActiveRecord::Migration
  def change
    add_column :d_restaurants, :owner_id, :integer
  end
end
