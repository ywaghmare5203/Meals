class AdminController < ApplicationController

  before_filter :admin_authenticate, :except => [:login_process, :login, :create_request, :new_request, :approve_by_email, :requested]
  before_filter :unset_user
  before_filter :ensure_superuser, :only => [:new,:new_process,:edit,:edit_process,:cluster,:cluster_process]
  before_filter :ensure_manager, :only => [:get_schedule, :newtarget, :settarget, :loadtarget, :freezeoffer]
  before_filter :ensure_copywriter, :only => [:load_restaurant]

  def login
    if admin_logged_in?
      flash[:notice]="You are already logged in"
      redirect_to( "/admin/")
    else
      render(:layout => "admin")
    end
  end

  def login_process
    email = params[:email] 
    password = params[:password]
    u = Admin.auth(email, password)
    if u.nil?
      flash[:notice]="Error logging in"
      redirect_to(admin_login_path)
    else
      session[:admin_id] = u.id

      # Redirect  the admin
      if current_admin.superuser?
       redirect_to(:controller=>"superuser", :action=>"dashboard",  :notice=>"Logged in", :layout => "superuser")

      elsif current_admin.manager?
          redirect_to(:controller=>"manager", :action=>"scheduler",  :notice=>"Logged in", :layout => "manager")

      elsif current_admin.admin?
         redirect_to(:controller=>"sales", :action=>"dashboard",  :notice=>"Logged in", :layout => "sales")

      elsif current_admin.copywriter?
         redirect_to(:controller=>"copywriter", :action=>"dashboard",  :notice=>"Logged in", :layout => "copywriter_layout")

      else # restaurant owner
       redirect_to(:controller=>"restaurants", :action=>"my_deals_library",  :notice=>"Logged in", :layout => "restaurant")
      end
            
     
    end
  end

  def logout
    session[:admin_id] = nil
    reset_session
     flash[:notice]="Logged out"
    redirect_to("/admin/login")
  end

  def dashboard
    
    if current_admin.superuser?
      @requests = Admin.where(:status => 0)
      @clusters = Cluster.all
      @restaurants = Restaurant.all
			# @cuisines = 
    elsif current_admin.manager?
      @dmeals = DMeal.where(:status => 0)
      @offers = Offer.where(:status => 1)
    elsif current_admin.admin?
      @requests = Admin.where(:city_id => current_admin.city_id, :status => 0)
      @restaurants =  [] 
      Restaurant.all.each do |r|
    
        @restaurants << r if r.admin.city.eql?(current_admin.city)
     
    
      end
      elsif current_admin.copywriter?
      # only take the local approved restaurants
      @restaurants = []
      restaurants = Restaurant.where(:status => 1)
      restaurants.each do |r|
        @restaurants << r if r.admin.city.eql?(current_admin.city)
      end
    else # restaurant owner
      @restaurants = current_admin.restaurants
      # @dmeals = current_admin.restaurants
    end

    if current_admin.superuser?
      @admins = Admin.where(:status => 1)
    end

    render(:layout => "admin")
  end

  # new admin user
  def new
    @admin = Admin.new
    render(:layout => false)
  end

  def new_process
    admin = Admin.create(params[:admin])
    admin.set_password(params[:admin][:password])
    admin.status = 1
    if admin.save    
      logger.info("Admin user created: #{admin.email}")
      flash[:notice]="Admin created"
      redirect_to(admin_url)
    else
      flash[:notice]="Error creating admin user"
      redirect_to(admin_url)
    end
  end

	# superuser, edit existing admin
	def edit
		@admin = Admin.find(params[:id])
    render(:layout => false)
	end


  def edit_process
    admin = Admin.find(params[:id])
		# admin.update_attributes(params[:admin])
		admin.attributes = params[:admin]

		unless(params[:pw].to_s.empty?)
    	admin.set_password(params[:pw])
		end

    admin.status = 1
		admin.request_hash = nil

    if admin.save    
      logger.info("Admin user (#{admin.email}) edited by #{ current_admin.email }")
      redirect_to(admin_url, :notice => "Admin edited")
    else
      redirect_to(admin_url, :notice => "Error editing admin user")
    end
  end


  # superuser: new cluster
  def new_cluster
    @cluster = Cluster.new
    render(:layout => false)
  end

  def edit_cluster
    @cluster = Cluster.find(params[:id])
    render(:new_cluster, :layout => false)
  end

  def cluster_process
    @cluster = Cluster.create(params[:cluster])
    redirect_to(admin_url, :notice => "Cluster created")
  end

  # create a restaurant, will generate request that 
  def new_request

    @restaurant = Restaurant.new
    @cities = City.all
  end

  def create_request

    if(Admin.where(:email => params[:email]).size > 0)
      redirect_to("/admin/request", :notice => "Email address exist already")
      return
    else
      @admin = Admin.create(:email => params[:email], :status => 0, :city_id => params[:city_id])
    end
    
    @restaurant = Restaurant.create(params[:restaurant])
    if current_admin?
      @restaurant.status = 1 # not approved yet
    else
      @restaurant.status = 0 # not approved yet
    end
    
    @restaurant.admin_id = @admin.id
    @restaurant.save
    # send email that user was created
    UserMailer.request_created(@admin).deliver
    redirect_to("/admin/requested")

  end

  def approve
    restaurant = Restaurant.find(params[:id].gsub("link",""))
    admin = restaurant.admin
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    random_hash  = ""
    1.upto(64) { |i| random_hash << chars[rand(chars.size-1)] }
    admin.request_hash = random_hash
    admin.save
    UserMailer.approved_request(admin).deliver     
    
    if admin.save
      render(:text => "{ \"status\": \"ok\"}")
    else
      render(:text => "{ \"status\": \"error\"}")
    end

  end
  
  # link clicked in email
  def approve_by_email
    @admin = Admin.where(:email => params[:email], :request_hash => params[:code]).first
    if @admin
      @admin.role_id = 0
      @admin.status = 1

      # only have 1 restaurant normally
      r = @admin.restaurants.first
      r.status = 1
      r.save

      @admin.save
      session[:admin_id] = @admin.id
      # set password
      redirect_to("/admin/newpw")
    else
      # wrong code
      redirect_to("/admin/", :notice => "Sorry, wrong code")
    end
  end

  # sets new password
  def newpw
    @sudo = true unless current_admin.request_hash.nil? 
  end

  def setpw
    a = current_admin
   
    if params[:pw].eql?(params[:pw2]) # if passwords match
      unless a.request_hash.nil? # this is a "sudo" call, first timer
        a.status = 1
        a.request_hash = nil
        a.set_password(params[:pw])
        a.save
        redirect_to("/admin/", :notice => "Password set");
      else
        unless Admin.auth(current_admin.email, params[:prev_pw]).nil?
          a.set_password(params[:pw])
          a.save
          redirect_to("/admin/", :notice => "Password changed");
        else
          # wrong password 
          redirect_to("/admin/newpw", :notice => "Wrong password");
        end
      end
    else
      redirect_to("/admin/newpw", :notice => "Passwords don't match") 
    end

  end


  def get_schedule
    @yday = params[:yday]
    @offers = Offer.where(:yday => @yday)
    @cuisines = Cuisine.all.sort{|x,y| x.name <=> y.name}
    @clusters = Cluster.all.sort{|x,y| x.name <=> y.name}
    render(:layout => false)
  end

  # toggles offers
  def setoffer
    offer = Offer.where(:id => params[:id]).first
    offer.status = 1 if params[:on].eql?("true")
    offer.status = 0 if params[:on].eql?("false")
    if offer.save
      render(:text => "{ \"status\": \"ok\"}")
    else
      render(:text => "{ \"status\": \"error\"}")
    end
  end

	def newtarget
		target = Target.create(:yday => params[:yday], :cuisine_id => params[:cuisine], :amount => params[:amount], :cluster_id => params[:cluster] )
    if target.save
      render(:text => "{ \"status\": \"ok\"}")
    else
      render(:text => "{ \"status\": \"error\"}")
    end
	end

	def settarget
    target = Target.where(:id => params[:id]).first
		target.amount = params[:amount].to_i
    if target.save
      render(:text => "{ \"status\": \"ok\"}")
    else
      render(:text => "{ \"status\": \"error\"}")
    end
	end

  def freezetarget
    t = Target.find(params[:id])
    unless t.frozen?
      t.frozen = true
      if t.save
        render(:text => "{ \"status\": \"ok\"}")
      else
        render(:text => "{ \"status\": \"error\"}")
      end
    end
  end

  def freezeoffer
    offer = Offer.find(params[:id])
    if offer.status.eql?(1)
      offer.maximum_order = params[:amount]
      offer.status = 2 # frozen
    
      if offer.save
        render(:text => "{ \"status\": \"ok\"}")
      else
        render(:text => "{ \"status\": \"error\"}")
      end
    else
        render(:text => "{ \"status\": \"ok\"}")
    end
  end

  # extended info from schedule, number of cuisines, etc..
  def get_schedule_info
    @yday = params[:yday]
    @offers = Offer.where(:yday => @yday, :status => 1)
    @cuisines = {}
    @offers.each do |offer|
      @cuisines[offer.deal.meal.cuisine.name] = @cuisines[offer.deal.meal.cuisine.name].to_i + 1
    end
    render(:layout => false)
  end

  # ajax for copywriters
  def load_restaurant
    r = Restaurant.find(params[:id])
    if current_admin.edit_restaurant?(r)
      @restaurant = r
    end
    render(:layout => false)
  end

  def load_meals
    r = Restaurant.find(params[:id])
    if current_admin.edit_restaurant?(r)
      @meals = r.meals
    end
    render(:layout => false)
  end

  # load 1 meal individually
  def load_meal
    m = Meal.find(params[:id])
    if current_admin.edit_restaurant?(m.restaurant)
      @meal = m
    end
    render(:layout => false)
  end

  def load_dmeal
    @orig = params[:id]
    m = DMeal.where(:meal_id => @orig).first
    @cuisines = Cuisine.all.sort{|x,y| x.name <=> y.name}
    if m && current_admin.edit_restaurant?(m.meal.restaurant) # rest of original meal
      @dmeal = m
    else
      @dmeal = DMeal.new(:meal_id => @orig)
    end
    render(:layout => false)
  end

  def save_dmeal
    d = DMeal.where(:meal_id => params[:id]).first
    d = DMeal.new if d.nil?
    d.update_attributes(params[:dmeal])

    unless d.photo?
      if params[:picture_dup].eql?("yes")
        d.photo = d.meal.picture
      end
    end

    d.owner_id = d.meal.restaurant.admin_id
    d.status = 0 # requires approval

    if d.save
      redirect_to admin_cwr_url(d.restaurant.original)
    end
  end

  def loadtarget
    @target = Target.find(params[:id])
    render(:layout => false)
  end

  def approve_dmeal
    if current_admin.manager? || current_admin.superuser?
      d = DMeal.where(:meal_id => params[:id]).first
      d.status = 1
      if d.save
        render(:text => "{ \"status\": \"ok\"}")
      else
        render(:text => "{ \"status\": \"error\"}")
      end
    else
      render(:text => "{ \"status\": \"auth error\"}")
    end
  end

  def load_drestaurant
    @orig = params[:id]
    d = DRestaurant.where(:restaurant_id => @orig).first
    @cuisines = Cuisine.all.sort{|x,y| x.name <=> y.name}
    @clusters = Cluster.all.sort{|x,y| x.name <=> y.name}
    if d && current_admin.edit_drestaurant?(d)
        @drestaurant = d
    else
      @drestaurant = DRestaurant.new
    end
    render(:layout => false)
  end

  def save_drestaurant
    d = DRestaurant.where(:restaurant_id => params[:id]).first
    d = DRestaurant.new if d.nil?
    d.update_attributes(params[:drestaurant])
    d.admin = current_admin
    d.owner_id = Restaurant.find(params[:drestaurant][:restaurant_id]).admin_id
    if d.save
      if d.new_record?
        logger.info("DRestaurant #{ d.id } created by #{ current_admin.email }") 
      else
        logger.info("DRestaurant #{ d.id } updated by #{ current_admin.email }") 
      end
      redirect_to admin_cwr_url(params[:id])
    end
  end

  def load_deal
    @deal = nil
    @meal = params[:id]
    dmeal = DMeal.where(:meal_id => @meal).first
    if dmeal && dmeal.approved?
      @deal = Deal.where(:d_meal_id => dmeal.id).first # only one anyways
      @deal = Deal.create(:d_meal_id => dmeal.id, :d_restaurant_id => dmeal.restaurant_id, :admin_id => current_admin.id) if @deal.nil?
      render(:layout => false)
    else
      render(:text => "This meal isn't ready for publishing yet.  It either doesn't exist, or wasn't approved yet.")
    end
  end

  def save_deal
    @meal = params[:id]
    dmeal = DMeal.where(:meal_id => @meal).first
    @deal = Deal.where(:d_meal_id => dmeal.id).first # only one anyways
    @deal.threshold = params[:threshold] 
    @deal.range = params[:range] 
    if @deal.save
        render(:text => "{ \"status\": \"ok\"}")
      else
        render(:text => "{ \"status\": \"error\"}")
    end
  end

  def preview
    
  end

  def update_email

begin
  current_admin.update_attributes!(:email=>params[:e_mail].to_s)
rescue => e
end
flash[:notice]= "Email is sucessfully Updated!!!!!!!"
redirect_to :action =>'my_account', :controller=>"restaurants",:layout=>false
end

def update_password

admin1= Admin.new
old_pass= params[:o_pass]
current_password = current_admin[:password]
admin_hash = current_admin[:hash]

if admin1.check_admin_password(admin_hash,old_pass,current_password)
 if params[:n_pass].eql?params[:cn_pass]
 begin
  current_admin.admin_set_password(params[:n_pass])
  #current_admin.save
rescue => e

 end
 if current_admin.save!
  flash[:notice]= "Password is sucessfully Updated!!!!!!!"
  redirect_to :action =>'my_account', :controller=>"restaurants",:layout=>false
 else
 
flash[:notice]= "Wrong Password! Please fill Currect password!!!!!!!"
redirect_to :action =>'my_account', :controller=>"restaurants",:layout=>false
 end
end

end
end

def update_phone


 begin
  current_admin.update_attributes!(:phone=>params[:phone])
rescue => e
 end

flash[:notice]= "Phone is sucessfully Updated!!!!!!!"
redirect_to :action =>'my_account', :controller=>"restaurants",:layout=>false
end

private 

end
