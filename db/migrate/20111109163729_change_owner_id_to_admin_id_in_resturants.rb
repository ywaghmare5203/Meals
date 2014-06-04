class ChangeOwnerIdToAdminIdInResturants < ActiveRecord::Migration
  def up
    rename_column :restaurants, :owner_id, :admin_id
  end

  def down
    rename_column :restaurants, :admin_id, :owner_id
  end
end
