class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
