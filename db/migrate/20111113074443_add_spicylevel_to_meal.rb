class AddSpicylevelToMeal < ActiveRecord::Migration
  def change
    add_column :meals, :spicy, :integer 
  end
end
