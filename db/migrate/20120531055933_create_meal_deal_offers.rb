class CreateMealDealOffers < ActiveRecord::Migration
  def change
    create_table :meal_deal_offers do |t|

      t.datetime  :date
      t.integer :res_id
      t.integer :quantity
      t.integer :target
      t.integer :cuisine_id
      t.integer :status
      t.integer :meal_id
      t.timestamps
    end
  end
end
