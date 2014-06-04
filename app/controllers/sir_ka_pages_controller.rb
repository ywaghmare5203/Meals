class PagesController < ApplicationController

  before_filter :authenticate, :only => [:dashboard, :getorders]

  def homepage
    # @city = City.detect(request.remote_ip)
    @clusters = Cluster.all
    if logged_in?

        @cluster = Cluster.find(current_user.cluster_id)
        @offers = get_offers
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
  def show
    id = params[:id].split("-")[0]
    @deal = Deal.find_by_id(id)
    raise if deal.nil?
    @offers = get_offers - [@deal.today_offer]
    # TODO: limit, cuisine prefs, ...
    @offers = @offers[0..3]
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
    puts "----------------------#{params[:user].inspect}-----------------------------2222222"
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
         @user.cluster_id = 1 # I have to make it dynamic
#        @user.set_password(user[:password])

         puts "-6666666----------#{@user.inspect}----------------------------------------777777"
            if @user.save

                  session[:user_id] = @user.id
#                  redirect_to(  (session[:ret] || "/"), :notice=>"Signed up and Logged in")


                  render :js => "window.location = '/'" , :notice=>"Signed up and Logged in"

             else

                  respond_to do |format|
                     format.html {  render :layout=>"ajax_layout"; }
                     format.js {  render :layout=>"ajax_layout"; }
                 end

            end

    end

   

#
#    if @user.nil?
#      @user = User.new(user)
#      @user.set_password(user[:password])
#
#         puts "-6666666----------#{@user.inspect}----------------------------------------777777"
#            if @user.save
#
#                  session[:user_id] = @user.id
#                  redirect_to(  (session[:ret] || "/"), :notice=>"Signed up and Logged in")
#             else
#
#                  respond_to do |format|
#                     format.html {  }
#                     format.js
#                 end
#
#            end
#
#    else
##      redirect_to(signup_url, :notice=>"User exists already")
#        respond_to do |format|
#                     format.html {  }
#                     format.js
#                 end
#
#    end

  end




def mobileapps
render :layout => "landing_layout"
end

def about_us
render :layout => "landing_layout"
end

def careers
render :layout => "landing_layout"
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


  get_offers
  
   render :layout => "todaysdeal_layout"
end

 # for showing Details of dishes

  def dishdetail
    @deals_url=params[:id]
    render :layout => "dishdetails_layout"
  end

    # for Order Dtails Pages

  def orderdetail

  end

  # for showing sucess pages

  def success

  end

  #for Mobile apps pages

  def mobileapps


  end

  # for invite friend

  def invitefriend

  end



private 

  def get_offers
    unless logged_in?
#      @offers = Offer.today_list(session[:cluster] || params[:id])
      cluster_id = params[:id].to_i
      @offers = Offer.today_list(cluster_id)
    else
      @offers = current_user.offer_list 
    end
  end

end
