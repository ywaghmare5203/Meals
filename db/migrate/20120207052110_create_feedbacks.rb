class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.integer :order_id
      t.integer :service
      t.integer :food
      t.integer :courtesy
      t.integer :cleanliness
      t.integer :value_for_money
      t.text :comments

      t.timestamps
    end
  end
end
