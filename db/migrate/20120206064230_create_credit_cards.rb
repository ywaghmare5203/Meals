class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.text :number
      t.integer :ccv
      t.integer :expiry_month
      t.integer :expiry_year
      t.integer :user_id
      t.integer :order_id

      t.timestamps
    end
  end
end
