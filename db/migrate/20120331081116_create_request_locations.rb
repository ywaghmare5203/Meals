class CreateRequestLocations < ActiveRecord::Migration
  def change
    create_table :request_locations do |t|

      t.string :r_name
      t.string :r_email
      t.string :r_location

      t.timestamps
    end
  end
end
