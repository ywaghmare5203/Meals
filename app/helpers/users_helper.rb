module UsersHelper

 def user_has_cuisine?(cuisine)
      if @user
         @user.cuisines.include?(cuisine)
      else
        false
      end
   end

    def user_is_veg?(user)
      return user.is_veg
   end


   def complete_name(location)
     return location.first_name + " " + location.last_name
   end


end
