class AddNewFieldsToRestaurents < ActiveRecord::Migration
   def up

    add_column :restaurants , :your_name ,:string
    add_column :restaurants , :owner_id, :integer
    add_column :restaurants  , :email, :string
    add_column :restaurants , :address2, :string
    add_column :restaurants , :zip_code, :string
    add_column :restaurants , :website, :string
    add_column :restaurants , :delivery_name, :string
    add_column :restaurants ,:delivery_staff,:string
    add_column :restaurants , :order_day,:string
    add_column :restaurants , :primary_cusine,:string
    add_column :restaurants , :combo_meals,:boolean



   end

  def down


    remove_column :restaurants , :your_name ,:string
    remove_column :restaurants , :owner_id, :integer
    remove_column :restaurants  , :email, :string
    remove_column :restaurants , :address2, :string
    remove_column :restaurants , :zip_code, :string
    remove_column :restaurants , :website, :string
    remove_column :restaurants , :delivery_name, :string
    remove_column :restaurants ,:delivery_staff,:string
    remove_column :restaurants , :order_day,:string
    remove_column :restaurants , :primary_cusine,:string
    remove_column :restaurants , :combo_meals,:boolean








  end
end
