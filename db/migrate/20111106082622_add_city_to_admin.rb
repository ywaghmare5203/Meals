class AddCityToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :city_id, :integer
  end
end
