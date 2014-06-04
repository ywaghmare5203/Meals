class AddClusterToUser < ActiveRecord::Migration
  def change
    add_column :users, :cluster_id, :integer
  end
end
