class AddStatusToDMeal < ActiveRecord::Migration
  def change
    add_column :d_meals, :status, :integer
  end
end
