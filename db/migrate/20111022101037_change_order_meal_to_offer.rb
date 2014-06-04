class ChangeOrderMealToOffer < ActiveRecord::Migration
  def up
    rename_column :orders, :meal_id, :offer_id
  end

  def down
    rename_column :orders, :offer_id, :meal_id
  end
end
