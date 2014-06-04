class AddOwnerIdToDMeal < ActiveRecord::Migration
  def change
    add_column :d_meals, :owner_id, :integer
  end
end
