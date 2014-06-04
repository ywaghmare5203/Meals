class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.integer :amount
      t.integer :yday
      t.integer :cuisine_id
      t.integer :cluster_id

      t.timestamps
    end
  end
end
