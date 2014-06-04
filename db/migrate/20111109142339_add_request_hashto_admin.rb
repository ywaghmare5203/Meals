class AddRequestHashtoAdmin < ActiveRecord::Migration
  def up
    add_column :admins, :request_hash, :string
  end

  def down
    remove_column :admins, :request_hash
  end
end
