class Target < ActiveRecord::Base

  validates_presence_of :yday, :cuisine_id, :amount, :cluster_id 
  # make it fail if we dont have this data

  belongs_to :cuisine
  belongs_to :cluster
  

	# sum of all available meals for that day
	def have
		amount = 0
		@offers = Offer.where(:yday => self.yday)
		@offers.each do |o|
	    amount += o.maximum_order.to_i if o.deal.meal.cuisine_id.eql?(self.cuisine_id) && o.deal.restaurant.cluster_id.eql?(self.cluster_id)
    end
		amount
	end


  def offers
		tmp = Offer.where(:yday => self.yday)
    offers = []
    tmp.each do |o|
      offers << o if o.deal.meal.cuisine_id.eql?(self.cuisine_id) && o.deal.restaurant.cluster_id.eql?(self.cluster_id)
    end
    offers 
  end

end
