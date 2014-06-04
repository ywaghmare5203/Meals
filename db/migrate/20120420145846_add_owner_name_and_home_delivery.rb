class AddOwnerNameAndHomeDelivery < ActiveRecord::Migration
  def up
  add_column :restaurants , :owner_name , :string
  add_column :restaurants , :home_delivery , :boolean
  end

  def down

  end
end
