class CreateClusters < ActiveRecord::Migration
  def change
    create_table :clusters do |t|
      t.string :name
      t.text :description
      t.text :points

      t.timestamps
    end
  end
end
