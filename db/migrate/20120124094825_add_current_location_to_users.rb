class AddCurrentLocationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :current_location, :integer
  end
end
