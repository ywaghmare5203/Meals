class AddStreetAndZipcodeToUser < ActiveRecord::Migration
 def up

    add_column :users , :street , :string
    add_column :users , :zipcode , :string
  end

  def down
  end
end
