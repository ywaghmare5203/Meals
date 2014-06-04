require 'will_paginate/array' 

class PagesController < ApplicationController

  before_filter :authenticate, :only => [:dashboard, :getorders]

  def homepage
    # @city = City.detect(request.remote_ip)
   
    @clusters = Cluster.all
    if logged_in?

       @cluster = Cluster.find(current_user.cluster_id)
       @offer_arr = get_offers
   
      
      # Here I have to check for some condition like
      # 1) If we have only one meal to show.
      # 2) If we have only 3 meals to show.

      raise if @offer_arr.nil?

      @offers  = @offer_arr.paginate(:page => params[:page],:per_page => params[:per_page] || 1)
      #puts "this is offer.........................yhis sis sfdsffs...#{@offers.inspect}"
        render( :layout => "todaysdeal_layout")
   
        
    else

      @cluster = Cluster.find(session[:cluster].to_i) if session[:cluster]
      @user = params[:user] ||  User.new
      @request_location = RequestLocation.new
       render(:action => :homepage_firsttime , :layout => "fullscreen")
    end
#    @clusters = Cluster.all
#    if session[:cluster].nil?
#      render(:action => :homepage_firsttime, :layout => "fullscreen")
#    else
#
#      if logged_in?
#        @cluster = Cluster.find(current_user.cluster_id)
#      else
#        @cluster = Cluster.find(session[:cluster].to_i)
#      end
#      @offers = get_offers
#    end
     rescue
         render(:action => "dealnotfound")

  end

  def homepage_firsttime
  end

  # sets the current cluster
  def setgeo
    cluster = Cluster.find_by_id( params[:c].to_i )
    if cluster
      session[:cluster] = cluster.id 
      session[:expires_at] = 14.days.from_now
      if logged_in?
        u = current_user
        u.cluster_id = cluster.id
        u.save
      end
      render(:text => "{ \"geo\": \"set\"}")
    else
      render(:text => "{ \"geo\": \"failed\"}")
    end
  end

  def reset
    reset_session
    redirect_to("/")
  end

  # get city based on geographical data
  def getgeo
    lat = params[:lat]
    lng = params[:lng]
    render(:text => "{ \"city\": \"Dubai\"}")
  end
  
  def dashboard
    @restaurants = Restaurant.where("owner_id = ?", current_user.id)
  end

  # show deal
#  def show
#    id = params[:id].split("-")[0]
#    @deal = Deal.find_by_id(id)
#    raise if @deal.nil?
#    @offers = get_offers - [@deal.today_offer]
#    # TODO: limit, cuisine prefs, ...
#    @offers = @offers[0..3]
#   render(:layout => "meal_detail_layout")
#
#  rescue
#    render(:action => "dealnotfound")
#  end


  def showdetails
   
    id = params[:id].split("-")[0]
    @deal = Deal.find_by_id(id)
    
    raise if @deal.nil?


      if logged_in?
            offer_list =  get_offers
      else
            offer_list =  get_todays_offers
      end


      all_offers = offer_list.flatten - [@deal.today_offer]

     # TODO: limit, cuisine prefs, ...
      cuisine_id = @deal.meal.cuisine_id
      all_offers.compact!

    @offers = all_offers
   

    if @user
    unless @user.is_veg?
 
      @offers =  all_offers.select{|offer|
        offer.deal.meal.cuisine_id == cuisine_id 
      }

    end
    end
#puts  "this is offerefddsfdsfdsfdsfsadf#{offer}"

      @offers = @offers[0..3]
    render(:layout => "meal_detail_layout")

  rescue
    render(:action => "dealnotfound")
  end



  def dealnotfound
    render(:text => "Deal not found")
  end

  def about
  end

  def contact
  end


  def signup_process
    user = params[:user]
    @user = User.where("email = ?", user[:email]).first


    if @user
              @user_exist = true
              respond_to do |format|
                     format.html { }
                     format.js {  }

                 end
    else
         @user = User.new(user)
         @user.set_password(user[:password], user[:password_confirmation])
        # @user.cluster_id = 1 # I have to make it dynamic instead of hardcoded
         @user.cluster_id = params[:cluster_nm]

          if @user.save
                  session[:user_id] = @user.id
                  render :js => "window.location = '/'" , :notice=>"Signed up and Logged in"
             else
                  respond_to do |format|
                     format.html { }
                     format.js {  }
                 end

            end

    end
  end


  
def mobileapps
render :layout => "landing_layout"
end

def about_us
render :layout => "landing_layout"
end

  def careers
#render


@career= Career.new()


if params[:career]
  @career.name=params[:career][:name]
  @career.email=params[:career][:email]
  tempfile =  params[:career][:file]

  # FILE UPLOAD

  require 'fileutils'
  if (tempfile.nil?)
    flash[:notice]= "Please fill all the details!!!!!!"

     return


 end
   tmp = params[:career][:file]
  file1 = File.join("public/data", params[:career][:file].original_filename)
  FileUtils.cp tmp.path, file1

  @career.file= params[:career][:file].original_filename

  
  if @career.save

  flash[:notice] = 'Your resume has been successfully uploaded!!'
  redirect_to(:controller => 'pages', :action => 'thankyou' , :layout => "landing_layout" , :notice => 'Profile was successfully updated')

  else


  end


end
end

  def privacy
render :layout => "landing_layout"
end

def terms
render :layout => "landing_layout"
end


def show_todays_meal
  @clusters = Cluster.all
  @cluster = Cluster.find(params[:id])
  session[:cluster_id] = params[:id].to_i
  @offers_outer_array =   get_todays_offers
  @offers  =  @offers_outer_array.paginate(:page => params[:page],:per_page => params[:per_page] || 1)

  render :layout => "todaysdeal_layout"

          respond_to do |format|
                     format.html { }
                     format.js {  }
                 end

end

def invite_friends
  render :layout => "landing_layout"
end

def thankyou
  render :layout => "landing_layout"
end


private 

  def get_offers
    unless logged_in?
    # @offers = Offer.today_list(session[:cluster] || params[:id])
      cluster_id = session[:cluster_id]
      @offers = Offer.today_list(cluster_id)
    else
      current_user.offer_list
       end
  end


    def get_todays_offers

     cluster_id = session[:cluster_id]

     Offer.today_offer_list(cluster_id)

  end




end


