class SalesController < ApplicationController
    def dashboard
     @clusters = Cluster.all
     @requests = Admin.where(:city_id => current_admin.city_id, :role_id => 2)
     puts"++_________+_____+_+_+_+_+_++_+_+current_admin_+_+_+_+_+_+_+_+_+_+_+_+-----__--------___#{current_admin.inspect}"
      @restaurants = []
      @sales_size =  Restaurant.find_all_by_sales_owner_id(current_admin.id)

      if @sales_size.size >0
        @sales_size.each do |r|
          @restaurants << r if r.admin.city.eql?(current_admin.city)
           puts"++_________+_____+_sales Size+_+_+_+_++_+_+_+_+_+_+_+_+_+_+_+_+_+_+-----__--------___#{@sales_size.size}"
      end
      end

     @restaurant_app =Restaurant.where(:is_deleted => 1,:status => 1)
     @restaurant_rejected = Restaurant.where(:is_deleted => 0,:status => 0)
     

  end

   def sales_locations
     @clusters = Cluster.all
@cuisines = Cuisine.all
@city = City.all
@staff_array = []
         @staff_array << ["Number of delivery staff" , nil]
      50.times do |i|
        @staff_array <<    [i+1,i+1]
      end

     @sales = Restaurant.new()

        if params[:sales]
          @sales.name=params[:sales][:name]
          @sales.cluster_id=params[:sales][:cluster_id]
          @sales.cuisine_id=params[:sales][:cuisine_id]
          @sales.delivery_staff=params[:sales][:delivery_staff]
          @sales.address=params[:sales][:address]
          @sales.address2=params[:sales][:address2]
          @sales.zip_code=params[:sales][:zip_code]
          @sales.phone=params[:sales][:phone]
          @sales.website=params[:sales][:website]
          @sales.point1_name=params[:sales][:point1_name]
          @sales.point1_email=params[:sales][:point1_email]
          @sales.point1_mobile=params[:sales][:point1_mobile]
          @sales.point2_name=params[:sales][:point2_name]
          @sales.point2_email=params[:sales][:point2_email]
          @sales.point2_mobile=params[:sales][:point2_mobile]
          @sales.description=params[:sales][:description]
          @sales.city_id=params[:sales][:city_id]
          @sales.city_id=params[:sales][:city_id]
          @admin = current_admin
          @sales.sales_owner_id = @admin.id
            

          @sales.lat= params[:sales][:lat]
           @sales.lng= params[:sales][:lng]
          @sales.is_deleted = 1
          @sales.status = 1

     


      if @sales.save

          flash[:notice]="Record Added Successfully"
          redirect_to :action =>'sales_locations', :controller=>"sales", :layout => "sales"


      else
        end
        end
  end

   def sales_locations_edit
 
      #@requests = Admin.where(:city_id => current_admin.city_id, :status => 0)
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
    @sales = Restaurant.find(params[:id])
    end
    if params[:update]
         @sales = Restaurant.find(params[:update])
                @sales.update_attributes!(params[:sale])
                @sales.lat=params[:sale][:lat].to_f
                @sales.lng=params[:sale][:lng].to_f
                @sales.delivery_staff=params[:sale][:delivery_staff]
                @sales.cluster_id =params[:sale][:cluster_id]
                @sales.cuisine_id =params[:sale][:cuisine_id]
                @sales.city_id =params[:sale][:city_id]
                @sales.is_deleted = 1
                @sales.status = 1
                @sales.save
                      flash[:notice]="Record Updated Successfully"
             redirect_to :action =>'dashboard', :controller=>"sales", :layout => "sales"
    end
   end

   def delete

      @restaurant = Restaurant.find(params[:id]).destroy
       flash[:notice]="Record Deleted Successfully"
      redirect_to(:controller=>'sales',:action => 'dashboard')
   
    end
  

 def check_email
   puts"Yogesh++++++++++++++++++++++Yogesh++++++++++++++++++__________#{params[:point1_email]}"

    emailcheck=Restaurant.find_by_point1_email(params[:point1_email])

    if emailcheck.nil?
      status_email=false

    else
      status_email=true

    end
   
    render :text=>status_email

end
end