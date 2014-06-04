class AddCityToUser < ActiveRecord::Migration
  def change
    add_column :users, :city_it, :integer
  end
end
