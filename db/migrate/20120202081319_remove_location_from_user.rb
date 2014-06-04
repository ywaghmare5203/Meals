class RemoveLocationFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :location
  end

  def down
    add_column :users, :location, :text
  end
end
