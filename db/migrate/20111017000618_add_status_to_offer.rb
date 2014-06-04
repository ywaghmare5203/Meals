class AddStatusToOffer < ActiveRecord::Migration
  def change
    add_column :offers, :status, :integer
  end
end
