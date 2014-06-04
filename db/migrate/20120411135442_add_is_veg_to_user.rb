class AddIsVegToUser < ActiveRecord::Migration
  def up

    add_column :users , :is_veg , :boolean , :default => false

  end

  def down
  end
end
