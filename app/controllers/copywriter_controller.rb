class CopywriterController < ApplicationController
def dashboard
        @restaurant = Restaurant.where(:status => 2)
        @restaurant_array = []
        @restaurant_array =  @restaurant.collect{|restaurant|[restaurant.name,restaurant.id]}
       
       
        if params[:addMeals]
        if params[:addMeals][:restaurant_id]
        @meals = Meal.find_all_by_restaurant_id_and_status(params[:addMeals][:restaurant_id])
        # puts"==========================this is restaurant testing hello======#{@meals.inspect}"
        #@meals=Meal.where(:restaurant_id=>@restaurant_array)

       @new_meals = Meal.find_all_by_restaurant_id_and_status(params[:addMeals][:restaurant_id],"1")
        @reject_meals_by_copy =Meal.find_all_by_restaurant_id_and_status(params[:addMeals][:restaurant_id],"3")
        @reject_meals_by_manager =Meal.find_all_by_restaurant_id_and_status(params[:addMeals][:restaurant_id],"5")

      end
        else
        @new_meals = Meal.where(:status => 1)
        @reject_meals_by_copy = Meal.where(:status => 3)
        @reject_meals_by_manager = Meal.where(:status => 5)
        end
        render( :layout => "copywriter_layout")
end

def edit_review
        @cuisine= Cuisine.all
        @cuisine_array= []
        @cuisine_array= @cuisine.collect{|cuisine|[cuisine.name,cuisine.id]}

        @meal= Meal.all
        @meal_array=[]
        @meal_array= @meal.collect{|meal|[meal.meal_info,meal.id]}
        @comment = MealsComment.find_by_meal_id(params[:id])
        if params[:id]
        @edit = Meal.find(params[:id])
        @comment = MealsComment.find_by_meal_id(params[:id])

        render( :layout => "copywriter_layout")
        end
end

def preview_business_alerts
        @preview_business =Meal.all
        @preview_business = Meal.find(params[:id])
        @restaurant_business = Restaurant.find(@preview_business.restaurant_id)
        render( :layout => "copywriter_layout")
end

def approved_meal
        if params[:id]
        @approve = Meal.find(params[:id])
        @approve.status = 2
        @approve.save!
        flash[:notice]="Your meal is  Successfully Approved"
        redirect_to :action =>"dashboard", :controller=>"copywriter", :layout => "copywriter_layout"
        end
end

def add_comment

 if params[:id]

        @edit = Meal.find(params[:id])
        @comment = MealsComment.find_by_meal_id(params[:id])
         puts("..............my meals ............#{params.inspect}")
        end
        @cuisine= Cuisine.all
        @cuisine_array= []
        @cuisine_array= @cuisine.collect{|cuisine|[cuisine.name,cuisine.id]}
        @meal= Meal.all
        @meal_array=[]
        @meal_array= @meal.collect{|meal|[meal.meal_info,meal.id]}
        if params[:update]
        @edit = Meal.find(params[:update])
        @comment = MealsComment.find_by_meal_id(params[:update])
         puts("..........................#{@comment.inspect}")
        end
        if @comment.nil?
        @edit = Meal.find(params[:update])
        @edit.update_attributes!(params[:meals])
        @comment = MealsComment.new
        @comment.deal_name = (params[:deal_name])?params[:deal_name]:0
        @comment.meal_info = (params[:meal_info])?params[:meal_info]:0
        @comment.meal_id =@edit.id
        @comment.picture_file_name =(params[:upload_photos])?params[:upload_photos]:0
        @comment.nutr_calories = (params[:nutrition])?params[:nutrition]:0
        @comment.nutr_fats =(params[:nutrition])?params[:nutrition]:0
        @comment.nutr_carbs =  (params[:nutrition])?params[:nutrition]:0
        @comment.nutr_protein =(params[:nutrition])?params[:nutrition]:0
        @comment.nutr_sodium = (params[:nutrition])?params[:nutrition]:0
        @comment.nutr_cholestrol = (params[:nutrition])?params[:nutrition]:0
        @comment.description =  (params[:about_the_meal])?params[:about_the_meal]:0
        @comment.commented_data =params[:meals][:commented_data]
        @comment.deal_tag =  (params[:add_deal_tags])?params[:add_deal_tags]:0
        @admin = current_admin
        @comment.reject_by_admin_id = @admin.id
        @edit.status = 3
        @edit.save

        if @comment.save!
           puts("..........upper................#{@comment.inspect}")
       flash[:notice]="Your meal is  Rejected"
      redirect_to :action => "dashboard", :controller=> "copywriter", :layout => "copywriter_layout"
        end

        else
        @edit = Meal.find(params[:update])
        @edit.update_attributes!(params[:meals])
        # @comment = MealsComment.new
        @comment.deal_name = (params[:deal_name])?params[:deal_name]:0
        @comment.meal_info = (params[:meal_info])?params[:meal_info]:0
        @comment.meal_id =@edit.id
        @comment.picture_file_name =(params[:upload_photos])?params[:upload_photos]:0
        @comment.nutr_calories = (params[:nutrition])?params[:nutrition]:0
        @comment.nutr_fats =(params[:nutrition])?params[:nutrition]:0
        @comment.nutr_carbs =  (params[:nutrition])?params[:nutrition]:0
        @comment.nutr_protein =(params[:nutrition])?params[:nutrition]:0
        @comment.nutr_sodium = (params[:nutrition])?params[:nutrition]:0
        @comment.nutr_cholestrol = (params[:nutrition])?params[:nutrition]:0
        @comment.description =  (params[:about_the_meal])?params[:about_the_meal]:0
        @comment.commented_data =params[:meals][:commented_data]
        @comment.deal_tag =  (params[:add_deal_tags])?params[:add_deal_tags]:0
        @admin = current_admin
        @comment.reject_by_admin_id = @admin.id
        @edit.status =3
        @edit.save

        if @comment.save!
puts("..................lower........#{@comment.inspect}")
        flash[:notice]="Your meal is  Rejected"
        redirect_to :action => "dashboard", :controller=> "copywriter", :layout => "copywriter_layout"
        end
        end
end

def reject_restaurant_by_manager
        if params[:id]
        @rej_manager = Meal.find(params[:id])
        @comment = MealsComment.find_by_meal_id(params[:id])
        end
        @cuisines = Cuisine.all
        @cuisine_array = []
        @cuisine_array =  @cuisines.collect{|cuisine| [cuisine.name,cuisine.id]}
        if params[:update]
        @rej_manager = Meal.find(params[:update])
        @comment = MealsComment.find_by_meal_id(params[:update])

        if @comment.nil?
        @rej_manager = Meal.find(params[:id])
        @comment = MealsComment.create
        @comment.deal_name = (params[:deal_name])?params[:deal_name]:0
        @comment.meal_info = (params[:meal_info])?params[:meal_info]:0
        @comment.meal_id = @rej_manager.id
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
        @rej_manager.status =3
        @rej_manager.save
        if @comment.save!
         flash[:notice]="Your meal is  Rejected"
        redirect_to :action =>"dashboard", :controller => "copywriter"
        end
        else
        @rej_manager = Meal.find(params[:update])
        @rej_manager.update_attributes!(params[:meals])
        # @comment = MealsComment.create
        @comment.deal_name = (params[:deal_name])?params[:deal_name]:0
        @comment.meal_info = (params[:meal_info])?params[:meal_info]:0
        @comment.meal_id = @rej_manager.id
        @comment.picture_file_name =(params[:upload_photos])?params[:upload_photos]:0
        @comment.nutr_calories = (params[:nutrition])?params[:nutrition]:0
        @comment.nutr_fats =(params[:nutrition])?params[:nutrition]:0
        @comment.nutr_carbs =  (params[:nutrition])?params[:nutrition]:0
        @comment.nutr_protein =(params[:nutrition])?params[:nutrition]:0
        @comment.nutr_sodium = (params[:nutrition])?params[:nutrition]:0
        @comment.nutr_cholestrol = (params[:nutrition])?params[:nutrition]:0
        @comment.description =  (params[:about_the_meal])?params[:about_the_meal]:0
         @comment.commented_data =params[:MealsCommented][:commented_data]
        @comment.deal_tag =  (params[:add_deal_tags])?params[:add_deal_tags]:0
        @admin = current_admin
        @comment.reject_by_admin_id = @admin.id
        @rej_manager.status =3
        @rej_manager.save
        if @comment.save!
        flash[:notice]="Your meal is  Rejected"
        redirect_to :action =>"dashboard", :controller => "copywriter", :layout => "copywriter_layout"
        end
        end
        end
       render :layout => "copywriter_layout"

        end
end


