class AddPrefrerredCuisinesToUser < ActiveRecord::Migration
  def change
    add_column :users, :cuisines, :string
  end
end
