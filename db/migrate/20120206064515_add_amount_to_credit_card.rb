class AddAmountToCreditCard < ActiveRecord::Migration
  def change
    add_column :credit_cards, :amount, :float
  end
end
