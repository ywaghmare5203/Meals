class AddStatusToTarget < ActiveRecord::Migration
  def change
    add_column :targets, :frozen, :boolean
  end
end
