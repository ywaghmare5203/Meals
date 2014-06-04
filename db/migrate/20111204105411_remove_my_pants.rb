class RemoveMyPants < ActiveRecord::Migration
  def up
    remove_column :restaurants, :delivery_area
    remove_column :d_restaurants, :delivery_area
  end

  def down
    add_column :restaurants, :delivery_area, :text
    add_column :d_restaurants, :delivery_area, :text
  end
end
