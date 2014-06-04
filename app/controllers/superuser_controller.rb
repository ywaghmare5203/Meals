class SuperuserController < ApplicationController
before_filter :admin_authenticate, :except => [:login_process, :login, :create_request, :new_request, :approve_by_email, :requested]
  before_filter :unset_user
  before_filter :ensure_superuser, :only => [:new,:new_process,:edit,:edit_process,:cluster,:cluster_process]
  before_filter :ensure_manager, :only => [:get_schedule, :newtarget, :settarget, :loadtarget, :freezeoffer]
  before_filter :ensure_copywriter, :only => [:load_restaurant]

  def dashboard
    @requests = Admin.where(:status => 0)
      @clusters = Cluster.all
      @restaurants = Restaurant.where(:status=>2)
      @admins = Admin.where(:status => 1)

    render(:layout => "superuser")
  end

  def edit_restaurant

              @clusters = Cluster.all
              @cluster_array = []
              @cluster_array =  @clusters.collect{|cluster| [cluster.name,cluster.id]}
              @cuisines = Cuisine.all
              @cuisine_array = []
              @cuisine_array =  @cuisines.collect{|cuisine| [cuisine.name,cuisine.id]}
              @city = City.all
              @city_array = []
              @city_array =  @city.collect{|city| [city.name,city.id]}
              @staff_array = []
              @staff_array << ["Number of delivery staff" , nil]
              50.times do |i|
              @staff_array <<    [i+1,i+1]
              end
              if params[:id]
                  @edit_rest = Restaurant.find(params[:id])
                  puts"_)()_)()_)()_)()_+_)()_+_)()_++_)()_+_+)))+_+_)()_+_)()_++_)(#{@edit_rest.inspect}"
              end
              if params[:update]
                    @edit_rest = Restaurant.find(params[:update])
                    @edit_rest.update_attributes!(params[:sale])
                    @edit_rest.lat=params[:sale][:lat].to_f
                    @edit_rest.lng=params[:sale][:lng].to_f
                    @edit_rest.delivery_staff=params[:sale][:delivery_staff]
                    @edit_rest.status = 2
                    @edit_rest.save
             end
            if params[:admin]
                     @admin_update =Admin.find(params[:admin])
                     @admin_update.email= params[:sale][:point1_email]
                     @admin_update.city_id= params[:sale][:city_id]
                     @admin_update.save
                    flash[:notice]="Restaurant Updated Successfully"
                    redirect_to :action =>'dashboard', :controller=>"superuser", :layout => "superuser"
              end
  end

  def restaurant_delete
    @rest_delete = Restaurant.find(params[:id])
    begin
 @restaurant_meal = Meal.where(:restaurant_id=>params[:id])
 @restaurant_meal.each do |restaurant_meal|
         restaurant_meal.destroy
          end
    rescue => e
    end

    begin
  @meal_deal_offer_delete = MealDealOffer.where(:meal_id=>@restaurant_meal[0].id)
  @meal_deal_offer_delete.each do |meal_deal_offer_delete|
         @meal_deal_offer_delete.destroy
          end
    rescue => e
    end
    begin
  @rest_sch_delete = RestaurantSch.where(:dish_id => @restaurant_meal[0].id)
    @rest_sch_delete.each do |rest_sch_delete|
         rest_sch_delete.destroy
          end
    rescue => e
    end
    @rest_delete.destroy
    flash[:notice]="Restaurants deleted Successfully"
     redirect_to :action =>'dashboard', :controller=>"superuser", :layout => "superuser"
  end

  def delete_cluster
@cluster_delete = Cluster.find(params[:id]).destroy
flash[:notice]="Cluster deleted Successfully"
     redirect_to :action =>'dashboard', :controller=>"superuser", :layout => "superuser"
  end

  def delete_admin

    @admin_delete = Admin.find(params[:id])
    if @admin_delete.role_id == 0
    @admin_restaurant = Restaurant.where(:admin_id => params[:id])
    puts""
    @admin_restaurant.each do |admin_rest|
    admin_rest.destroy
   end
    begin
    @rest_meal = Meal.where(:restaurant_id=>@admin_restaurant[0].id)
       @rest_meal.each do |rest_meal|
          
         rest_meal.destroy
           
           end
           rescue => e
    end
    begin

   @meal_offer_delete = MealDealOffer.where(:meal_id=>@rest_meal[0].id)
  @meal_offer_delete.each do |meal_offer_delete|
    meal_offer_delete.destroy

   end
    rescue => e
    end
    begin
   @restuarant_sch_delete = RestaurantSch.where(:dish_id => @rest_meal[0].id)
     @restuarant_sch_delete.each do |restuarant_sch_delete|
       restuarant_sch_delete.destroy
     end
    rescue =>e
    end
    end
      @admin_delete.destroy

 flash[:notice]="Admin deleted Successfully"
 redirect_to :action =>'dashboard', :controller=>"superuser", :layout => "superuser"

  
  end

  # new admin user
  def new

    @admin = Admin.new

               puts"==========================admin superuser new===================#{@admin.inspect}"
    render(:layout => false)
  end

  def new_process
    admin = Admin.create(params[:admin])
    admin.set_password(params[:admin][:password])
    admin.status = 1
    if admin.save
      puts"==========================admin superuser new_process===================#{admin.inspect}"
      logger.info("Admin user created: #{admin.email}")
       flash[:notice]="Admin Successfully Created"
      redirect_to(:controller =>"superuser",:action =>"dashboard")
    else
      flash[:notice]="Error creating admin user"
      redirect_to(:controller =>"superuser",:action =>"dashboard")
    end
  end

    # superuser, edit existing admin
    def edit
        @admin = Admin.find(params[:id])
    puts"==========================admin superuser edit===================#{@admin.inspect}"
    puts"============================i am  params plesase tell me my values=======#{params.inspect}"
     puts"_______________params[:admin]____________________________#{params[:admin].inspect}"
      render(:layout => false)
    end


 def edit
		@admin = Admin.find(params[:id])
     render(:layout => false)
	end


  def edit_process
    admin = Admin.find(params[:id])
		# admin.update_attributes(params[:admin])
		admin.attributes = params[:admin]

		unless(params[:admin][:password].to_s.empty?)
    	admin.set_password(params[:admin][:password])
		end

    admin.status = 1
		admin.request_hash = nil

    if admin.save
      if admin.role_id==0
 @restaurant_up = Restaurant.find_by_admin_id(params[:rest_admin])
@restaurant_up.point1_email = params[:admin][:email]
@restaurant_up.city_id = params[:admin][:city_id]
@restaurant_up.save
      end
      logger.info("Admin user (#{admin.email}) edited by #{ current_admin.email }")
      flash[:notice]="Admin Successfully Updated"
      redirect_to(:controller =>"superuser",:action =>"dashboard")
    else
      flash[:notice]="Error creating admin user"
      redirect_to(:controller =>"superuser",:action =>"dashboard")
    end
  end
  def new_cluster
    @cluster = Cluster.new()
    if params[:cluster]
    @cluster.name = params[:cluster][:name]
    @cluster.description = params[:cluster][:description]
    @cluster.points = params[:cluster][:points]
    if @cluster.save
      flash[:notice]="Cluster Successfully Created"
     redirect_to(:controller =>"superuser",:action =>"dashboard")
    end
  end
end

  def edit_cluster
    if params[:id]
    @cluster = Cluster.find(params[:id])
    end
    if params[:cluster_edit]
       @cluster = Cluster.find(params[:cluster_edit])
       @cluster.update_attributes!(params[:cluster])
       @cluster.name = params[:cluster][:name]
       @cluster.description = params[:cluster][:description]
       @cluster.points = params[:cluster][:points]
       flash[:notice]="Cluster Successfully Updated"
       redirect_to(:controller =>"superuser",:action =>"dashboard")
    end
end


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



end