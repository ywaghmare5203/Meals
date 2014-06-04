class CreateMealsComments < ActiveRecord::Migration
  def change
    create_table :meals_comments do |t|

       t.integer :meal_id
      t.text :commented_data
      t.string :deal_name
      t.text :description
      t.string :meal_info
      t.string :deal_tag
      t.string :nutr_calories
      t.string :nutr_fats
      t.string :nutr_cholestrol
      t.string :nutr_sodium
      t.string :nutr_carbs
      t.string :nutr_protein
      t.string :reject_by_admin_id
      t.string :picture_file_name

      t.timestamps
    end
  end
end
