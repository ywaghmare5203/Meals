class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :offer
  # has_many :offers

  def process # process when payment is confirmed
    self.status = 1
    u = User.find(self.user_id)
    u.points += 10
    return true if (self.save && u.save)
    return false
  end

end
