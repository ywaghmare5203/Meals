class CreateCareers < ActiveRecord::Migration
  def change
    create_table :careers do |t|

      t.string :name
      t.string :email
      t.string :file

      t.timestamps
    end
  end
end
