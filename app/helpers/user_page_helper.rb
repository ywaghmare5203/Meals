module UserPageHelper
  
  def  current_username
    unless @user.nil?
      if @user.name  && @user.name.length > 0
        return @user.name
      else
        return @user.email
      end
    end

  end

def getRestaurant_name(id)
    restaurant = Restaurant.find(id)
    restaurant.name
  end
def full_name(location)
  return location.first_name + " " + location.last_name
end

end
