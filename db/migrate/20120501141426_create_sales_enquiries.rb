class CreateSalesEnquiries < ActiveRecord::Migration
  def change
    create_table :sales_enquiries do |t|

      t.string :name
      t.string :your_name
      t.string :owner_name
      t.string :email
      t.string :address1
      t.string  :address2
      t.integer :zip_code
      t.string :phone
      t.string :website
      t.string :delivery_staff
      t.string :order_day
      t.boolean :combo_meals
      t.string :primary_cuisine
      t.string :home_delivery
      t.integer :admin_id
      t.integer :status



      t.timestamps
    end
  end
end
