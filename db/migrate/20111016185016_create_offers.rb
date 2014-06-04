class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :weekday
      t.integer :meal_id
      t.integer :maximum_order

      t.timestamps
    end
  end
end
