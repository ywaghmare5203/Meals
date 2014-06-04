class ChangeMealAndDMealFromSpicyToVeg < ActiveRecord::Migration
  def up
		remove_column :meals, :spicy
		remove_column :d_meals, :spicy
		add_column :meals, :vegetarian, :boolean
		add_column :d_meals, :vegetarian, :boolean
  end

  def down
		remove_column :meals, :vegetarian
		remove_column :d_meals, :vegetarian
		add_column :meals, :spicy, :integer
		add_column :d_meals, :spicy, :integer
  end
end
