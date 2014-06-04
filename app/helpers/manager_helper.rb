module ManagerHelper
  def get_cuisine_nameby_id(cid)
  begin
    @Cuisine=Cuisine.find(cid)
    @Cuisine.name
  rescue=> e
  end
  end

  def getAdminNamebyId(aid)
   begin
    @Admin=Admin.find(aid)
    @Admin.email
   rescue => e
   end
  end

  def getCheckedStatus(id)
      @status=Restaurant.find_by_id(id)
        if @status.status.to_i == 1
        "checked='checked'"
     else
          false
      end
  end
   def get_restaurant_name_by_id(rid)

    begin
    @restaurant= Restaurant.find(rid)
    @restaurant.name
    rescue=>e
    end
  end
 def getCusine_id(id)
   @cuisine_name = Cuisine.find(id)
   @cuisine_name.name

 end
 def getMeal_name_by_id(id)

  @meal_name = Meal.find_by_id(id)
   unless @meal_name.nil?
  @meal_name.name
end
end
  def getRestaurant_id_by_cuisine_id(id)
    @cuisine_id = Restaurant.find(id)
    @cuisine_id.cuisine_id
  end

  def getRestaurant_name(id)
    restaurant = Restaurant.find(id)
    restaurant.name
  end
 

end