class AddNutritionalInfo < ActiveRecord::Migration

  def up
    add_column :d_meals, :nutr_calories, :text
    add_column :d_meals, :nutr_protein, :text
    add_column :d_meals, :nutr_carbs, :text
    add_column :d_meals, :nutr_cholesterol, :text
    add_column :d_meals, :nutr_fats, :text
    add_column :d_meals, :nutr_sodium, :text
  end

  def down
    remove_column :d_meals, :nutr_calories
    remove_column :d_meals, :nutr_protein
    remove_column :d_meals, :nutr_carbs
    remove_column :d_meals, :nutr_cholesterol
    remove_column :d_meals, :nutr_fats
    remove_column :d_meals, :nutr_sodium
  end

end
