class OffersController < ApplicationController

  before_filter :admin_authenticate # all  

  def toggle
	  deal = Deal.find(params[:id])
    if current_admin.owns_restaurant?(deal.restaurant.original)
	    offers = Offer.where(:deal_id => deal.id)
	    yday = params[:yday]
	    offer = offers.where(:yday => yday).first
			amount = params[:amount]
	    if offer.nil?
	      offer = Offer.create(:deal_id=>deal.id,:yday=>yday,:status=>1, :maximum_order => amount) 				
	    else
				offer.maximum_order = amount
	      offer.status = 1
	      offer.save
	    end
	    render(:text => "{ \"status\": \"ok\"}")
		else
	    render(:text => "{ \"status\": \"auth\"}")
		end
  end


  def create
    @deal = Deal.find(params[:id])
    # wether owner owns this restaurant
    if current_admin.owns_restaurant?(@deal.restaurant.original)
      yday = params[:yday].gsub("m#{ @meal.id }d", "") # just the number
      checked = params[:checked]

      # find or create?
      offer = Offer.where(:meal_id => @meal.id, :yday => yday).first
      offer = Offer.create!(:meal_id => @meal.id, :yday => yday) if offer.nil?
      if checked.eql?("true")
        offer.status = 1
      else
        offer.status = 0
      end
      offer.save
      render(:text => "{ \"status\": \"ok\"} ")
    else
      render(:text => "{ \"error\": \"auth\"}")
    end
  end

  def edit
  end

  def destroy
  end

end
