class Deal < ActiveRecord::Base
  belongs_to :d_meal
  belongs_to :d_restaurant

  def meal
    self.d_meal
  end

  def restaurant
    self.d_restaurant
  end

  def today_offer
   # return Offer.where(:deal_id => self.id, :yday => Time.now.yday).first # should be only one

    return Offer.where(:deal_id => self.id, :yday => 104).first # should be only one
  end

  def still_left? # if there are still deals left
    self.amount_left.to_i.eql?(-1) || self.amount_left.to_i > 0
  end

  def amount_left
    unless self.threshold.to_i.eql?(0)
      orders = 0
      all_orders = Order.where(:offer_id => self.today_offer.id)
      all_orders.each do |o|
        orders += o.amount
      end
      left = self.threshold - orders
      return left
    else
      return -1 
    end
  end

  def url
    return "#{ self.id }-#{ self.meal.name.downcase.gsub(" ","-")}"
  end

end
