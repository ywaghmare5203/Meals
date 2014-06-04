class AddFoodPrefsToUser < ActiveRecord::Migration
  def change
    add_column :users, :fp_vegetarian, :boolean
    add_column :users, :fp_vegan, :boolean
    add_column :users, :fp_glutenfree, :boolean
  end
end
