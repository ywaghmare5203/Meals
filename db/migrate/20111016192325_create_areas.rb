class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :name
      t.text :points
      t.integer :parent_id

      t.timestamps
    end
  end
end
