class CreateUserPages < ActiveRecord::Migration
  def change
    create_table :user_pages do |t|

      t.timestamps
    end
  end
end
