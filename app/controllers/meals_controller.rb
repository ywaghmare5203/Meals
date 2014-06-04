class MealsController < ApplicationController

  before_filter :admin_authenticate, :except => [:show]
  before_filter :authenticate, :only => [:order]
    

  def new
    @restaurant = params[:id]
    r = Restaurant.find(@restaurant)
    return unless current_admin.owns_restaurant?(r)
    @meal = Meal.new(:restaurant_id => params[:id])
    @cuisines = Cuisine.all.sort{|x,y| x.name <=> y.name}
    render(:layout => "admin") 
  end

  def create    
    @meal = Meal.create!(params[:meal])
    @meal.restaurant_id = params[:id]
    @meal.save
    redirect_to(admin_url) # show_meal_url(@meal.restaurant_id, @meal.id))
  end

  def edit
    @meal = Meal.find(params[:id])
    @restaurant = @meal.restaurant_id 
    @cuisines = Cuisine.all.sort{|x,y| x.name <=> y.name}
    render(:layout => "admin") 
  end

  def update
    @meal = Meal.find(params[:meal_id])
    if @meal.update_attributes(params[:meal])
      redirect_to(show_meal_url(@meal.restaurant.id, @meal.id), :notice => 'successfully updated.')
    else
      redirect_to(edit_meal_url(@meal.restaurant.id, @meal.id), :notice => 'Error while updating.')
    end
  end

  def delete
  end

  def show
    @meal = Meal.find(params[:id])
    raise unless @meal && @meal.today_offer
    if @meal.today_offer      
      @offers = []
      if logged_in?
        @offers = current_user.offer_list - [@meal.today_offer]
      else
        @offers = Offer.today_list - [@meal.today_offer]
      end
    end
  rescue
      redirect_to notfound_url
  end

  def notfound
    if logged_in?
      @offers = current_user.offer_list
    else
      @offers = Offer.today_list 
    end
  end

  def order
  end

  def list
    @restaurant = Restaurant.find(params[:id])
    unless current_admin.owns_restaurant?(@restaurant)
      redirect_to "/admin"
    else
      render(:layout => false)
    end
  end

end
