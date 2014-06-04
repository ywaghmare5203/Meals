class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :description
      t.float :lat
      t.float :lng
      t.integer :owner_id

      t.timestamps
    end
  end
end
