class AddPoAndAddressToUser < ActiveRecord::Migration
  def self.up


    add_column :users, :po, :integer
    add_column :users, :address, :string

  end

  def self.down

   remove_column :users, :first_step
   remove_column :users, :first_step
  end
end
