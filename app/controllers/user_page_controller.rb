require 'will_paginate/array' 

class UserPageController < ApplicationController
  before_filter :authenticate, :only => [:dashboard, :getorders]

  def user_page_home
    @clusters= Cluster.all
      if logged_in?
        user_details = User.find(session[:user_id])
        #finding the cuisine related to cuisine
        prefrence= CuisinesUsers.where(:user_id=>user_details.id)
        cuisine_prefrence = prefrence.collect{|cuisine_prefrence| cuisine_prefrence.cuisine_id}
        #cluster = Cluster.find(user_details.cluster_id)
             
       #@all_meal_info1
        @all_meal=image_page(user_details.cluster_id,cuisine_prefrence)
          
          raise if  @all_meal.empty?  

            @all_meal_info1 = @all_meal.paginate(:page => params[:page],:per_page => params[:per_page] || 2)
            render :layout=>"todaysdeal_layout"
        
      elsif params[:id]
        first_time_user = params[:id]
        @all_meal = image_page(first_time_user,[2,3,4,5,6,7,8,9])
        
            @all_meal_info1=@all_meal.paginate(:page => params[:page],:per_page => params[:per_page] || 4) 
            render :layout=>"todaysdeal_layout"
                     
      else
        render(:action => :homepage , :layout => "fullscreen")
          
      end  
        rescue
          render(:action=>"dealnotfound")
  end
  
  def showdetails
    id = params[:id].split("-")[0]
    @meal_details = Meal.find(id)
    @restaurant = Restaurant.find_by_id(@meal_details.restaurant_id)
    @location = Location.where(:user_id=>session[:user_id])
    
    #render(:layout => "meal_detail_layout")
  end

  def dealnotfound
    render(:text => "Deal not found")
  end

  def about
  end

  def contact
  end

  def dashboard
    @restaurants = Restaurant.where("owner_id = ?", current_user.id)
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
            redirect_to(:controller => 'user_page', :action => 'thankyou' , :layout => "landing_layout" , :notice => 'Profile was successfully updated')
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

    def about_us
      render :layout => "landing_layout"
    end

    def homepage
     @clusters = Cluster.all
     #render :action => :user_page_home , :layout => "fullscreen"end
    end
private
  def image_page(id,cuisine_prefrence)
    @cluster = Cluster.find(id)
    # find the restaurant and also thecking cuisine prefrence and cluster id
    restaurant = Restaurant.where(:cluster_id=>@cluster.id,:cuisine_id=>cuisine_prefrence)
    
    restaurant_array = restaurant.collect{|x| x.id}
    
    todays_meal = []
    @all_meal_info = []
    
    time = Time.new().strftime("%Y-%m-%d")
     
    restaurant_array.each do |i|
      todays_meal<< MealDealOffer.where(:res_id=>i,:date=>time,:status=>4)
    end
    
    @all_meal_info1=[]
    
    unless todays_meal.empty?
      todays_meal.flatten!.each do |i|
        @all_meal_info<<Meal.find(i.meal_id)
      end

      return all_meal=@all_meal_info
    end
      
  end


  def logged_in?
    return (session[:user_id].to_i > 0)
  end

# till now we did nt use this ....arv
  def get_todays_offers

     cluster_id = session[:cluster_id]

     Offer.today_offer_list(cluster_id)
  end
end
  
