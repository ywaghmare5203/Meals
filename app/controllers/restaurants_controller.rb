class RestaurantsController < ApplicationController

before_filter :admin_authenticate, :except => [:create, :new, :thankyou,:getdealsinfo]
before_filter :ensure_admin, :only => [:approve]
layout "restaurant"
include MealsHelper

          def dashboard
                  @restaurants = current_admin.restaurants
                  @restaurant_sch_all= RestaurantSch.all
                  @rest = Restaurant.where(:restaurant_id=>getresid(session[:admin_id]))
                  @meal = find_all_dishes #Dmeal.where(:restaurant_id => session[:admin_id])
                  meal_info = Meal.where(:restaurant_id=>getresid(session[:admin_id]))
                  # calling the calender method
                  getallCalenderlisting
                  render(:layout=>"restaurant")
          end


          def new
                  if admin_logged_in? && current_admin.superuser?
                  redirect_to("/admin", :notice => "You can't add a restaurant as a superuser")
                  else
                  @restaurant = SalesEnquiry.new
                  @cuisines = Cuisine.all
                  @cuisines = Cuisine.all.sort{ |c,d| c.name <=> d.name }

                  @cuisines_array = []
                  @cuisines_array =  @cuisines.collect{|cuisine| [cuisine.name,cuisine.id]}
                  @cuisines_array << ["Mulyiple cuisine",8]
                  @staff_array = []
                  @staff_array << ["Number of delivery staff" , nil]
                  50.times do |i|
                  @staff_array <<    [i+1,i+1]
                  end
                  render(:layout => "restaurent_owner")
                  end
          end

          def create
                  # create admin account
                  unless admin_logged_in?
                  if(Admin.where(:email => params[:restaurant][:email]).size > 0)
                  #TODO: create restaurant under this email address?
                  redirect_to("/restaurants/new", :notice => "Email address exist already, maybe you forgot your password?")
                  else
                  @admin = Admin.create(:email => params[:email], :status => 0 )
                  end
                  else
                  @admin = current_admin
                  end
                  # all ok with the admin account, create restaurant
                  @restaurant = SalesEnquiry.create(params[:restaurant])
                  @restaurant.status = 0 # needs to be approved
                  if @restaurant.save
                  flash[:notice]= "Form successfuly submitted!!!!!!!"
                  render( :action => 'thankyou'  , :layout => "admin")
                  else
                  @cuisines = Cuisine.all
                  @cuisines = Cuisine.all.sort{ |c,d| c.name <=> d.name }
                  @cuisines_array = []
                  @cuisines_array =  @cuisines.collect{|cuisine| [cuisine.name,cuisine.id]}
                  @cuisines_array << ["Mulyiple cuisine",8]
                  @staff_array = []
                  @staff_array << ["Number of delivery staff" , nil]
                  50.times do |i|
                  @staff_array <<    [i+1,i+1]
                  end
                  render( :action => 'new' )
                  end
                  # flash[:notice] = 'Restaurant created.'
                  # send email?
                  # UserMailer.request_created(@restaurant).deliver   otification is commented
                  #redirect_to("/admin/restaurants/thank_you", :notice => "Restaurant created")
          end

          def show
                  @restaurant = Restaurant.find(params[:id])
                  @meals = Meal.where("restaurant_id = ?", @restaurant.id)
          end

          def list
                  @restaurants = Restaurant.all
          end

          def edit
                  @clusters = Cluster.all
                  @restaurant = Restaurant.find(params[:id])
                  if current_admin.owns_restaurant?(@restaurant)
                  render(:layout => "admin")
                  else
                  logger.info("-- [SECURITY!] #{current_admin.email} tried to alter #{ @restaurant.name } (#{@restaurant.id}) ")
                  redirect_to("/admin/", :notice => "Not allowed")
                  end
          end

          def edit_process
                  @restaurant = Restaurant.find(params[:id])
                  if current_admin.owns_restaurant?(@restaurant)
                  @restaurant.update_attributes(params[:restaurant])
                  @restaurant.save
                  redirect_to("/admin/", :notice => "Restaurant #{ @restaurant.name } updated")
                  else
                  logger.info("-- [SECURITY!] #{current_admin.email} tried to alter #{ @restaurant.name } (#{@restaurant.id}) ")
                  redirect_to("/admin/", :notice => "Not allowed")
                  end
          end

          def find_cluster
                  point = params[:point]
                  c = Cluster.find_for_point?(point)
                  ret = ""
                  if c
                  ret = c.to_dashboard_json
                  else
                  ret = "{\"status\": \"error\"}"
                  end
                  render( :text => ret )
          end

          def approved
                  restaurant = Restaurant.find(params[:id])
                  restaurant.status = 1
                  if restaurant.save
                  UserMailer.approved_restaurant(restaurant).deliver
                  else
                  render(:text => "{ \"status\": \"error\"}")
                  end
                  flash[:notice]= "email has been send"
                  redirect_to :action=>"manage_locations", :controller=>"restaurants"
          end


          def get_sch
            puts "adfffffffffffffffffffffffffffffffffff#{params.inspect}"
                  @meals = find_all_dishes
                  @restaurant_sch_all = RestaurantSch.all
                  @restaurant_sch = RestaurantSch.new

                  if params[:restaurant_sch]
                  @res_id =
                  if RestaurantSch.find_by_date_and_res_id((params[:restaurant_sch][:date])&& (getresid(session[:admin_id]))).nil?
                  @restaurant_sch.quantity =30
                  @restaurant_sch.date = params[:restaurant_sch][:date]
                  @restaurant_sch.dish_id= params[:post][:dish_id]
                  @restaurant_sch.res_id= getresid(session[:admin_id])
                  @restaurant_sch.status=1
                  if @restaurant_sch.save
                  flash[:notice]="Meals Sucessfully scheduled"
                  else
                  flash[:notice]=@restaurant_sch.errors
                  end
                  else
                  flash[:notice]="Schedule Already Added!"
                  end
                  end
                  getallCalenderlisting
          end

          def find_all_dishes
                  @rest = Restaurant.where(:restaurant_id=>getresid(session[:admin_id]))
                  meal = Meal.where(:restaurant_id =>getresid(session[:admin_id]))
                  @approve=  meal.where(:status=>4)
                  @pending =  meal.where(:status=>1)
                  @rejected_by_copy = meal.where(:status=>3)
          end

          def delete
                  RestaurantSch.find(params[:id]).destroy
                  redirect_to(:controller => 'sales', :action => 'dashboard')
                  flash[:notice]= "meals has been successfuly"
          end

          def getallCalenderlisting
                  # for Schedule Listiing
                  @cuisine_all = Cuisine.all
                  res_id=getresid(current_admin.id)
                  allrestlist=RestaurantSch.find(:all, :select=>" *,DAYOFMONTH(date) as m_day ", :conditions=>["res_id=?",res_id])
                  @Restaurants_Schdule_listing=allrestlist
                  if allrestlist.size > 0
                  @BookedSchdule=''
                  allrestlist.each do |list|
                  @BookedSchdule+="{"
                  @BookedSchdule+="title:'#{getmealbyid(list.dish_id).to_s}',"
                  @BookedSchdule+="start: new Date('#{list.date.strftime('%Y,%m,%d')}'),"
                  @BookedSchdule+="end: new Date('#{list.date.strftime('%Y,%m,%d')}')"
                  @BookedSchdule+= "},"
                  end
                  end
                  @calanderValidate = ''
                  allrestlist.each do |cal_validate|
                  @calanderValidate+="{"
                  @calanderValidate+="DateID:'#{(cal_validate.dish_id)}',"
                  @calanderValidate+="DateValue:'#{cal_validate.date.strftime('%m/%d/%Y')
                  }'"
                  @calanderValidate+= "},"
                  end
          end

          def delete_meal
                 @meal_delete =  Meal.find(params[:id]).destroy
                  flash[:notice]="Record Deleted Successfully"
                  redirect_to :controller => "restaurants", :action => "my_deals_library", :layout=>"restaurant"
          end

          def preview_business
                  @preview_business = Meal.find(params[:id])
                  @restaurant_business = Restaurant.find(@preview_business.restaurant_id)
                  @restaurant = Restaurant.find(params[:id])
                  render(:layout=>"restaurant")
          end

          def restaurant_comment
                  restaurant_details = Restaurant.find_by_admin_id(session[:admin_id])
                  add_comment = []
                  add_comment[0] = params[:restaurant_comment][:addcomment]
                  add_comment[1] =  restaurant_details
                  UserMailer.addcomment(add_comment).deliver
                  flash[:notice] = "Your message has been sent"
          end

          def my_deals_library
                  @restaurants = current_admin.restaurants
                  @restaurant_sch_all= RestaurantSch.all
                  @rest = Restaurant.where(:restaurant_id=>getresid(session[:admin_id]))
                  @meal_info = Meal.where(:restaurant_id=>getresid(session[:admin_id]))
                  @pending =   @meal_info.where(:status=>1)
                  @approve =    @meal_info.where(:status=>4)
                  @rejected_by_copy = @meal_info.where(:status=>3)
          end


          def manage_locations
                  @restaurant = Restaurant.find(getresid(session[:admin_id]))

                  render(:layout=>"restaurant")
          end

          def my_account
                  render(:layout=>"restaurant")
          end

          def order_history
                  render(:layout=>"restaurant")
          end

          def schedule
             puts "hiii how are youuuuuuuuuuuuuuuuuuu#{params.inspect}"
          @check_meal_id = params[:id]

            getallCalenderlisting
            meal = Meal.where(:restaurant_id =>getresid(session[:admin_id]))
            @approve=  meal.where(:status=>3)
            @pending =  meal.where(:status=>1)
            @meals = find_all_dishes
            @restaurant_sch_all = RestaurantSch.all
            @restaurant_sch = RestaurantSch.new
              if params[:restaurant_sch]
                @res_id =
                  if RestaurantSch.find_by_date_and_res_id((params[:restaurant_sch][:date])&& (getresid(session[:admin_id]))).nil?
                    @restaurant_sch.quantity =30
                    @restaurant_sch.date = params[:restaurant_sch][:date]
                    @restaurant_sch.dish_id= params[:post][:dish_id]
                    @my = params[:post][:dish_id]
                    @restaurant_sch.res_id= getresid(session[:admin_id])
                    @restaurant_sch.status=1
                      if @restaurant_sch.save
                        flash[:notice]="meals has been schedule"
#                       else
#                      flash[:notice]=@restaurant_sch.errors
                       end
                 else
             flash[:notice]="Schedule Already Added!"
           
                end
                redirect_to  :action => "schedule"
         
           end
                   end
  def getdealsinfo
    @meal_info= Meal.find_by_id(params[:meal_id])
    render :layout=>false,:text=>"#{@meal_info.picture_file_name}" 
  end


def add_deal

  @meal = Meal.where(:restaurant_id =>getresid(session[:admin_id]))
  @cuisions_addDeal_new= Meal.new
  cuisineid=getCuisine_id(session[:admin_id])
  @cuisions_addDeal= Cuisine.all.collect{|c|[c.name,c.id]}
    if params[:addMeals]
      @cuisions_addDeal_new.name=params[:addMeals][:name]
      @cuisions_addDeal_new.cuisine_id=cuisineid
      @cuisions_addDeal_new.description=params[:addMeals][:description]

          if params[:addMeals][:meal_info].nil?
            @cuisions_addDeal_new.meal_info= params[:m]
          else
           @cuisions_addDeal_new.meal_info=params[:addMeals][:meal_info].unshift("#{params[:m]}").to_s
        
           end
      @cuisions_addDeal_new.deal_tag= params[:addMeals][:deal_tag]
      @cuisions_addDeal_new.picture=params[:addMeals][:picture]
      @cuisions_addDeal_new.nutr_calories=params[:addMeals][:nutr_calories]
      @cuisions_addDeal_new.nutr_fats=params[:addMeals][:nutr_fats]
      @cuisions_addDeal_new.nutr_cholestrol=params[:addMeals][:nutr_cholestrol]
      @cuisions_addDeal_new.nutr_sodium=params[:addMeals][:nutr_sodium]
      @cuisions_addDeal_new.nutr_carbs=params[:addMeals][:nutr_carbs]
      @cuisions_addDeal_new.nutr_protein=params[:addMeals][:nutr_protein]
      @cuisions_addDeal_new.status= 1
      @cuisions_addDeal_new.restaurant_id =  getresid(session[:admin_id])

      if @cuisions_addDeal_new.save
        
        
          
           flash[:notice]="save sucessfully"
           redirect_to :controller => "restaurants", :action => "add_deal", :layout=>"restaurant"
          
          else
           flash[:notice]=@cuisions_addDeal_new.errors

         end
     
  end
                                   
  end




          def deals_pipeline
                  getallCalenderlisting
                  render(:layout=>"restaurant")
          end

          def preview
                  @preview_business = Meal.find(params[:id])
                  @restaurant_business = Restaurant.find(@preview_business.restaurant_id)
                  render(:layout=>"restaurant")
          end

          def reject_copywriter
                  @cuisines = Cuisine.all
                  @cuisine_array = []
                  @cuisine_array =  @cuisines.collect{|cuisine| [cuisine.name,cuisine.id]}
                  @meal_comment = MealsComment.find_by_meal_id(params[:id])
                  puts"___________________________meal_Comment________________#{@meal_comment.inspect}"
                  if params[:id]
                  @rej_copy = Meal.find(params[:id])
                  end
                  if params[:update_meal]
                  @rej_copy = Meal.find(params[:update_meal])
                  @rej_copy.update_attributes(params[:meal_comment])
                  @rej_copy.status = 1
                  @rej_copy.save!
                  redirect_to :controller => "restaurants", :action => "my_deals_library", :layout=>"restaurant"
                  end
          end
          def thankyou
                  render(:layout => "restaurent_owner")
          end


          def invite_friends
          end
  def restaurant_comment
    add_comment = []
    unless params[:restaurant_comment][:addcomment].empty?
    res_details = Restaurant.find(getresid(session[:admin_id])).point1_email
 
    add_comment<<params[:restaurant_comment][:addcomment]<<res_details

   
    UserMailer.addcomment(add_comment).deliver
    flash[:notice] = "mail has been sent"
    else


      flash[:notice] = "please wright some comments"
    end
    redirect_to :action=>"manage_locations",:controller=>"restaurants"
  end


  def update_email

    begin
    current_admin.update_attributes!(:email=>params[:e_mail].to_s)
    rescue =>e
    end

   
     flash[:notice]= "Email is sucessfully Updated!!!!!!!"
     redirect_to :action =>'my_account',:controller=>"restaurants"
   end

   def update_password

     admin1= Admin.new
     old_pass= params[:o_pass]
     current_password = current_admin[:password]
     admin_hash = current_admin[:hash]

     if admin1.check_admin_password(admin_hash,old_pass,current_password)
       if params[:n_pass].eql?params[:cn_pass]
        
           current_admin.admin_set_password(params[:n_pass])
  current_admin.save
       
      flash[:notice]= "Password is sucessfully Updated!!!!!!!"
redirect_to :action =>'my_account', :controller=>"restaurants",:layout=>false
end
else
   puts "hiii i am hereeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeelseeeeeeeeeeeeeee#{admin1.check_admin_password(admin_hash,old_pass,current_password)}"

flash[:notice]= "Wrong Password! Please fill Currect password!!!!!!!"
redirect_to :action =>'my_account', :controller=>"restaurants",:layout=>false
end
end

def update_phone
 if params[:phone].length >9 and params[:phone].length < 13


  begin
  current_admin.update_attributes!(:phone=>params[:phone])
rescue => e
 end

flash[:notice]= "Phone is sucessfully Updated!!!!!!!"
redirect_to :action =>'my_account', :controller=>"restaurants",:layout=>false
else
  flash[:notice]= "phone no should  10 digit to 12 and  "
  redirect_to :action =>'my_account', :controller=>"restaurants",:layout=>false
end
  
end


private

          def getresid(admin_id)
                  @restaurant=Restaurant.find_by_admin_id(admin_id)
                  @restaurant.id
          end

def getCuisine_id(id)
  @cuisineid =Restaurant.find_by_admin_id(id)
  @cuisineid.cuisine_id
end
end


