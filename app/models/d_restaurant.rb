class DRestaurant < ActiveRecord::Base
  belongs_to :admin # copywriter
  belongs_to :restaurant # original
  belongs_to :cuisine
  belongs_to :cluster

  def copywriter
    self.admin
  end

  def owner
    Admin.find(self.owner_id)
  end

  def original
    self.restaurant
  end

end
