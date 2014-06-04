class RemoveColumnsFromLocation < ActiveRecord::Migration
  def up
    
    remove_column :locations, :name
    remove_column :locations, :address
    add_column :locations, :first_name ,:string
    add_column :locations, :last_name ,:string
    add_column :locations, :address_line1 ,:string
    add_column :locations, :address_line2 ,:string
    add_column :locations, :city ,:string
    add_column :locations, :state ,:string
    add_column :locations, :zipcode ,:integer
    add_column :locations, :phone ,:string
    add_column :locations, :address_tagged_as ,:string
    add_column :locations, :primary_address , :boolean
    

  end

  def down

    add_column :locations, :name
    add_column :locations, :address
    remove_column :locations, :first_name 
    remove_column :locations, :last_name 
    remove_column :locations, :address_line1
    remove_column :locations, :address_line2 
    remove_column :locations, :city 
    remove_column :locations, :state 
    remove_column :locations, :zipcode 
    remove_column :locations, :phone 
    remove_column :locations, :address_tagged_as 
    remove_column :locations, :primary_address

  end
end
