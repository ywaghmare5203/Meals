class ChangeGeoForUser < ActiveRecord::Migration
  def up
    add_column :users, :lat, :float
    add_column :users, :lng, :float
    add_column :users, :location, :string
    remove_column :users, :city_it
    remove_column :users, :role_id
  end

  def down
    remove_column :users, :lat
    remove_column :users, :lng
    remove_column :users, :location
    add_column :users, :city_it, :integer
    add_column :users, :role_id, :integer
  end
end
