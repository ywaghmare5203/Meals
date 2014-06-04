class ChangeWeekdaytoYdayInOffers < ActiveRecord::Migration
  def up
    add_column :offers, :yday, :integer
    remove_column :offers, :weekday
  end

  def down
    add_column :offers, :weekday, :integer
    remove_column :offers, :yday
  end
end
