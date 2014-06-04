class ManagerController < ApplicationController

  def scheduler
    findCusine
    getMealSchedule_date

    @dmeals = Meal.where(:status => 0)
    @offers = Offer.where(:status => 1)
    #@restaurants = Restaurant.where(:status => 0)
    @restaurants = Restaurant.all
    @restaurants = Restaurant.where(:is_deleted => 1,:status => 1)
    @restaurant_deleted = Restaurant.where(:is_deleted => 0, :status => 0)
    @approved_restaurants = Restaurant.where(:status => 2)
      if params[:manager]
        rest= params[:manager][:check1].each do |rest|
        @manager = Restaurant.find(rest)
        @manager.update_attribute("status",1)
        admin =Admin.create(:city_id=>@manager.city_id,:email=>@manager.point1_email,:role_id=>0,:password=>"123456",:phone=>@manager.phone)
        admin.set_password("123456")
        admin.status = 1
          if admin.save
            @manager.admin_id=admin.id
            @manager.save
            
            begin
              UserMailer.request_created(admin).deliver
            rescue =>e
            end
         end
        end
        flash[:notice]="Resturants Approved and User is Created"
      end
      @meals= Meal.where(:status=>2)
  end

def restaurant_edit
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
        @restaurants = Restaurant.find(params[:id])
 end

if params[:update]
 @restaurants = Restaurant.find(params[:update])
  @restaurants.update_attributes!(params[:restaurants])
  @restaurants.cuisine_id=params[:restaurants][:cuisine_id]
  @restaurants.cluster_id=params[:restaurants][:cluster_id]
  @restaurants.city_id=params[:restaurants][:city_id]
  @restaurants.cluster_id=params[:restaurants][:cluster_id]
  @restaurants.delivery_staff =params[:restaurants][:delivery_staff]
  @restaurants.lat =params[:restaurants][:lat]
  @restaurants.lng =params[:restaurants][:lng]

    @restaurants.save!
   
#
   end
if params[:admin]
@admin_update =Admin.find(params[:admin])
#@admin_update.update_attributes!(params[:restaurants])
@admin_update.email= params[:restaurants][:point1_email]
@admin_update.save
puts"gol________________________Admin____________++++++++#{params[:admin].inspect}"
flash[:notice]="Record Updated Successfully"
 redirect_to :action =>'portfolio', :controller=>"manager", :layout => "manager"

  end


  end

def approved_dishes
    if params[:id]
      @manager_view_deal = Meal.find(params[:id])
      @manager_view_deal.status = 4
      @manager_view_deal.save!
flash[:notice]="Meals Approved Successfully"
      redirect_to :action=> "approval" , :controller=>"manager"
    end
  end

def edit_review
            @cuisine= Cuisine.all
            @cuisine_array= []
            @cuisine_array= @cuisine.collect{|cuisine|[cuisine.name,cuisine.id]}

            @meal= Meal.all
            @meal_array=[]
            @meal_array= @meal.collect{|meal|[meal.meal_info,meal.id]}
            if params[:id]
            @meals = Meal.find(params[:id])
            render( :layout => "manager")
            end
  end

def add_comment
    if params[:update]
    @comment = MealsComment.find_by_meal_id(params[:update])
    end
            if @comment.nil?
            @meals = Meal.find(params[:update])
            @meals.update_attributes!(params[:meals])
            @comment = MealsComment.create
            @comment.deal_name = (params[:deal_name])?params[:deal_name]:0
            @comment.meal_info = (params[:meal_info])?params[:meal_info]:0
            @comment.meal_id = @meals.id
            @comment.picture_file_name =(params[:upload_photos])?params[:upload_photos]:0
            @comment.nutr_calories = (params[:nutrition])?params[:nutrition]:0
            @comment.nutr_fats =(params[:nutrition])?params[:nutrition]:0
            @comment.nutr_carbs =  (params[:nutrition])?params[:nutrition]:0
            @comment.nutr_protein =(params[:nutrition])?params[:nutrition]:0
            @comment.nutr_sodium = (params[:nutrition])?params[:nutrition]:0
            @comment.nutr_cholestrol = (params[:nutrition])?params[:nutrition]:0
            @comment.description =  (params[:about_the_meal])?params[:about_the_meal]:0
            @comment.commented_data = params[:MealsCommented][:commented_data]
            @comment.deal_tag =  (params[:add_deal_tags])?params[:add_deal_tags]:0

            @admin = current_admin
            @comment.reject_by_admin_id = @admin.id

            @meals.status =5
            @meals.save
             @comment.save!


else
            @meals = Meal.find(params[:update])
            @meals.update_attributes!(params[:meals])
           # @comment = MealsComment.create
            @comment.deal_name = (params[:deal_name])?params[:deal_name]:0
            @comment.meal_info = (params[:meal_info])?params[:meal_info]:0
            @comment.meal_id = @meals.id
            @comment.picture_file_name =(params[:upload_photos])?params[:upload_photos]:0
            @comment.nutr_calories = (params[:nutrition])?params[:nutrition]:0
            @comment.nutr_fats =(params[:nutrition])?params[:nutrition]:0
            @comment.nutr_carbs =  (params[:nutrition])?params[:nutrition]:0
            @comment.nutr_protein =(params[:nutrition])?params[:nutrition]:0
            @comment.nutr_sodium = (params[:nutrition])?params[:nutrition]:0
            @comment.nutr_cholestrol = (params[:nutrition])?params[:nutrition]:0
            @comment.description =  (params[:about_the_meal])?params[:about_the_meal]:0
            @comment.commented_data = params[:MealsCommented][:commented_data]
            @comment.deal_tag =  (params[:add_deal_tags])?params[:add_deal_tags]:0

            @admin = current_admin
            #@comment.reject_by_admin_id = @admin.id

            @meals.status =5
            @meals.save

            @comment.save!


  end
   redirect_to :action => "approval", :controller=> "manager", :layout => "manager"
  end


  def restaurants_approved

@restaurants = Restaurant.find(params[:id])
@restaurants.update_attribute("status",1)
admin =Admin.create(:city_id=>@restaurants.city_id,:email=>@restaurants.point1_email,:role_id=>0,:password=>"123456",:phone=>@restaurants.phone)
admin.set_password("123456")
admin.status = 1
if admin.save
@restaurants.admin_id=admin.id
@restaurants.status=2
@restaurants.save
begin
UserMailer.request_created(admin).deliver
rescue=>e
end
end
flash[:notice]="Resturants Approved and User is Created"
redirect_to :action=> "approval" , :controller=>"manager"
end

def restaurants_delete
        @restaurant_deleted = Restaurant.find(params[:id])
          @restaurant_deleted.status= 0
         @restaurant_deleted.is_deleted=0
          if @restaurant_deleted.save
            flash[:notice]="Resturants rejected "
        redirect_to :action=> "approval" , :controller=>"manager"
          end


end

def permanent_delete
  @permanent_delete = Restaurant.find(params[:id]).destroy
  flash[:notice]="Restaurant deleted Successfully"
  redirect_to :action=> "approval" , :controller=>"manager"

end

def partially_delete
          @permanent_delete = Restaurant.find(params[:id])
          @permanent_delete.status= 1
          @permanent_delete.is_deleted=1
          @permanent_delete.save
 flash[:notice]="Resturants Rejected Successfully"
 redirect_to :action=> "approval" , :controller=>"manager"
end

def  findCusine
    @cuisines = Cuisine.all.sort{|x,y| x.name <=> y.name}
    @arabic = findcuisine_byid(2)
    @asian =   findcuisine_byid(3)
    @indian =  findcuisine_byid(4)
    @Continental =  findcuisine_byid(5)
    @american =  findcuisine_byid(6)
    @other =  findcuisine_byid(7)
    @veg =  findcuisine_byid(8)
    @multi =  findcuisine_byid(9)
  end
  def findcuisine_byid(id)
    cuisine_details = Meal.where(:cuisines_id=>id)
  end

  def getMealSchedule_date
    @schedule_details2 = find_cuisine_details(2)
    @schedule_details3 = find_cuisine_details(3)
    @schedule_details4 = find_cuisine_details(4)
    @schedule_details5 = find_cuisine_details(5)
    @schedule_details6 = find_cuisine_details(6)
    @schedule_details7 = find_cuisine_details(7)
    @schedule_details8 = find_cuisine_details(8)
    @schedule_details9 = find_cuisine_details(9)
  end

  def find_cuisine_details(id)
    cuisine_id =  Restaurant.where(:cuisine_id=>id)
   
    @schedule_details = []
    cuisine_id.each do |i|
      @schedule_details1= RestaurantSch.where(:res_id=>i.id)
      @schedule_details<< @schedule_details1
      @schedule_details.flatten!
    end
    @schedule_details.group_by(&:date)
  end
  
  def get_popup_arabic
    #featiching value for showing popup in manager page
    date=params[:date]
    get_popup(date,2)
    render(:layout=>false) 
  end
  
  def get_popup_asian
  #featiching value for showing popup in manager page
    date=params[:date]
    get_popup(date,3)
    
    render(:layout=>false) 
  end
  
  def get_popup_india
  #featiching value for showing popup in manager page
    date=params[:date]
    get_popup(date,4)
    render(:layout=>false) 
  end
  
  def get_popup_continental
    #featiching value for showing popup in manager page
    date=params[:date]
    get_popup(date,5)
    render(:layout=>false) 
  end
  
  def get_popup_american
  #featiching value for showing popup in manager page
    date=params[:date]
    get_popup(date,6)
    render(:layout=>false) 
  end
   
  def get_popup_other
    date=params[:date]
    get_popup(date,7)
    render(:layout=>false) 
   end
   
   def get_popup_veg
    date=params[:date]
    get_popup(date,8)
    render(:layout=>false) 
  end
  
  def get_popup_multicuisines
    date=params[:date]
    get_popup(date,9)
    render(:layout=>false) 
  end
 
  
   
    
    def get_popup(date,id)
      #featiching value for showing popup in manager page
      popup=RestaurantSch.where(:date=>date)
     #through date only wecan not find the currect result thats whay we have to match the cuisine id
      @popup_value=[]   
      @id= []
      popup.each do |i|
        begin
        restaurant_details = Restaurant.find(i.res_id)
          
        if restaurant_details.cuisine_id == id
          @id<< restaurant_details.cuisine_id #array of cuisine id for displaying name of cuisine
          @popup_value<< i

   end
      rescue=>e
      end

    end
    end
 def is_a_number?(s)

  s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true

end




  def getSchedule_popup
    # i am changing here adding res id
    find_meal_deal_offer = MealDealOffer.where(:date=>params[:getSchedule][:date],:res_id=>params[:getSchedule][:res_id])
      if find_meal_deal_offer[0].nil?
      #counting the restaurant_id becaues all data is coming in array form
        count_restaurant =  params[:getSchedule][:target].count
          @a=0
          (0...count_restaurant).each do |i|
            @a+=i
            @popup_details = MealDealOffer.new
            @popup_details.date =params[:getSchedule][:date]
            @popup_details.target = params[:getSchedule][:target][i] if is_a_number?(params[:getSchedule][:target][i]) == true 
            @popup_details.res_id = params[:getSchedule][:res_id][i]
            @popup_details.quantity = 30
            @popup_details.cuisine_id = params[:getSchedule][:cuisine_id][i]
            @popup_details.meal_id = params[:getSchedule][:dish_id][i]
            @popup_details.status = 4
 
              if @popup_details.save
                #mail_to_owner  #sending mail to owner
                @update_restaurant_status = RestaurantSch.where(:res_id=>params[:getSchedule][:res_id][i],:date=>params[:getSchedule][:date])
                @update_restaurant_status.update_all(:status =>0)
                @popup_details.save
              else
                flash[:notice]="plese fill the target value"

              end
              flash[:notice]= "meals has been schedule"
          end
      else
        flash[:notice] = "alredy awarded"
        end
      render :layout=>false
  end

  def addDeals
    @meal_details = Meal.where(:restaurant_id=>1)
    @meal_details.update_attribute(:name1 => params[:addMeals][:name], :cuisine_id => params[:addMeals][:cuisine_id], :description => params[:addMeals][:description],
    :meal_info =>params[:addMeals][:meal_info],:deal_tag=>params[:addMeals][:deal_tag],:nutr_calories=>params[:addMeals][:nutr_calories],:nutr_fats=>params[:addMeals][:nutr_fats],
    :nutr_cholestrol=>params[:addMeals][:nutr_cholestrol],:nutr_sodium=>params[:addMeals][:nutr_sodium],:nutr_carbs=>params[:addMeals][:nutr_carbs],:nutr_protein=>params[:addMeals][:nutr_protein])
  end

  def mail_to_owner
    send_message=[]
    restaurant_details = Restaurant.find(params[:getSchedule][:res_id][@a])
   
    send_message[0]= "your target is #{params[:getSchedule][:target][@a]}"
    send_message[1] =  restaurant_details 
    
    UserMailer.send_message(send_message).deliver
    flash[:notice] = "Your message has been sent"

  end

  def pipeline
    # for Schedule Listiing on calender

   @cuisine_all = Cuisine.all
  
   allrestlist= MealDealOffer.find(:all, :select=>" *,DAYOFMONTH(date) as m_day ")
  
   @Restaurants_Schdule_listing=allrestlist
     if allrestlist.size > 0
     @BookedSchdule=''

      allrestlist.each do |list|
      
        @BookedSchdule+="{"
        @BookedSchdule+="title:'#{getRestaurant_name(list.res_id)}',"
        @BookedSchdule+="start: new Date('#{list.date.strftime('%Y,%m,%d')}'),"
        @BookedSchdule+="end: new Date('#{list.date.strftime('%Y,%m,%d')}')"
        @BookedSchdule+= "},"
     end

    end
  end
  
  def approval

     @restaurant_deleted = Restaurant.where(:is_deleted => 0, :status => 0)

@meals= Meal.where(:status=>2)
    @restaurants = Restaurant.where(:is_deleted => 1,:status => 1)

  end

  def feedback

    render :layout => "manager"

  end

  
  def portfolio
 @restaurants = Restaurant.where(:status => 2)
 render :layout => "manager"

  end

  private

    def getresid(admin_id)
      begin
      @restaurants=Restaurant.find_by_admin_id(admin_id)

      @restaurants.id
     
      rescue=>e
      end
    end
   def getRestaurant_name(id)
     begin
    restaurant = Restaurant.find(id)
    restaurant.name
     end
   rescue=>e
   end
  

end










