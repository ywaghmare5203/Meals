class UserCuisinesRelationship < ActiveRecord::Migration
  def up


    create_table :cuisines_users, :id => false  do |t|
      t.integer :user_id
      t.integer :cuisine_id

    end


  end

  def down

  drop_table :cuisines_users


  end
end
