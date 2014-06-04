class AddPoToLocation < ActiveRecord::Migration
  def change
  add_column :locations , :po , :integer


  end
end
