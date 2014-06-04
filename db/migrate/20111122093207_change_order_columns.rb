class ChangeOrderColumns < ActiveRecord::Migration
  def up
    rename_column :offers, :meal_id, :deal_id
  end

  def down
    rename_column :offers, :meal_id, :deal_id
  end
end
