class OrdersController < ApplicationController

  before_filter :authenticate

  def show
  end

  def create
    offer = Offer.find_by_id(params[:id])
    amount = params[:amount].to_i
    user = current_user
    # check if exists, and is allowed to be ordered today
    if ( logged_in? && offer && offer.valid_today? && amount > 0 && amount < 10)
      o = Order.where("user_id = ? AND offer_id = ?", current_user.id, offer.id).first
      if o && o.created_at.yday.eql?(Date.today.yday)
        o.amount += 1
        o.save
        render(:text => "{ \"status\": \"updated\"}")
      else
        @order = Order.create(:user_id => user.id, :offer_id => offer.id, :amount => amount)
        render(:text => "{ \"status\": \"created\"}")
      end
    else
      render(:text => "{ \"status\": \"error\"}")
    end
    
  end

  def edit
  end

  def save
  end

  def delete
  end

end
