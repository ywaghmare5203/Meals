class UsersController < ApplicationController

  before_filter :authenticate, :only => [:signup2, :logout, :forgotpw, :set_fp, :setloc ,:set_preferences ]

  def login
   session[:ret] = request.referer || '/'
    # session[:ret] = '/'
  end

  # the post of the login
  def login_process
    email = params[:email]
    password = params[:password]
    u = User.auth(email, password)
    if u.nil?
     #  redirect_to(login_path, :notice=>"Error logging in")
     redirect_to(root_url, :notice => "Error logging in")
    else
      session[:user_id] = u.id
      session[:expires_at] = 14.days.from_now
    #  redirect_to((session[:ret] || "/"), :notice=>"Logged in")
       redirect_to(("/"), :notice=>"Logged in")
    end
    
  end

  def signup
    session[:ret] = request.referer || '/'
    @user = User.new
  end

  def signup_process
    user = params[:user]

    @user = User.where("email = ?", user[:email]).first
    if @user.nil?
      @user = User.new(:email => user[:email])
      @user.set_password(user[:password])
      session[:user_id] = @user.id if @user.save
      redirect_to((session[:ret] || "/"), :notice=>"Logged in")
    else
      redirect_to(signup_url, :notice=>"User exists already")
    end
    
  end

  # set food preferences
  def set_fp
    return unless params[:key].include?("fp_")

    u = current_user

    key = params[:key]
    val = params[:val]
  
    # FIX: rails throws an error here
    # current_user.update_attribute(key => val)
    
    case key 
      when"fp_vegetarian"
        u.fp_vegetarian = val
      when "fp_vegan"
        u.fp_vegan = val
      when "fp_glutenfree"
        u.fp_glutenfree = val
    end

    if(u.save)
      render(:text => "{ \"status\": \"ok\" }")
    else
      render(:text => "{ \"status\": \"error\" }")
    end

  end

  def setloc
    u = current_user
    u.lat = params[:lat]
    u.lng = params[:lng]
    if(u.save)
      render(:text => "{ \"status\": \"ok\" }")
    else
      render(:text => "{ \"status\": \"error\" }")
    end
  end

  def signup2
  end

  def forgotpw
  end


  def profile
    @cuisines = Cuisine.all.sort{|x,y| x.name <=> y.name }
  end

  def logout
    session[:user_id] = nil
    reset_session
    redirect_to(root_url, :notice => "Logged out")
  end

  def show
  end

  def edit
  end


 def forgot_password

        email  = @email_address = params[:email]
        @user = User.where("email = ?", params[:email]).first

        return if @user.nil?

        random_password = random_string



     begin

         @user.set_password(random_password, random_password)
         if @user.save
          UserMailer.password_confermation(email ,random_password).deliver
          @msg = "Your email has been send to #{email}"

         end
    rescue Exception => e
 
      @msg = "Email can not be send"
    end

  
               respond_to do |format|
                     format.html { }
                       format.js {  }
                   end



  end


  def get_it_listed

    request_location = RequestLocation.new(params[:request_location])
    request_location.save

               respond_to do |format|
                     format.html { }
                       format.js { }
                   end

  end


  def set_preferences
    @cuisines = Cuisine.all.sort{|x,y| x.name <=> y.name }

   # @delivery_locations = @user.locations

    #@new_location = Location.new


    if params[:preference]

      if params[:update].to_s=="yes"

        @update_user = Location.find(params[:locationid])

        @update_user.update_attributes(params[:preference])
        flash[:notice]="Record Updated Successfully"

      else

        if params[:preference]
          @preference= Location.new()
          # @preference= Location.new(params[:preference])
          @preference.first_name=params[:preference][:first_name]
          @preference.last_name=params[:preference][:last_name]
          @preference.address_line1=params[:preference][:address_line1]
          @preference.address_line2=params[:preference][:address_line2]
          @preference.address_tagged_as=params[:preference][:address_tagged_as]
          @preference.city=params[:preference][:city]
          @preference.state=params[:preference][:state]
          @preference.zipcode=params[:preference][:zipcode]
          @preference.phone=params[:preference][:phone]
          @preference.primary_address=params[:preference][:primary_address]
       
          @preference.save   @preference.user_id=@user.id
          flash[:notice]="Record Added Successfully"

        end
      end
    end

    @userlocation  = Location.find_all_by_user_id(@user.id)

  end




 def update_user_name

    begin
           @user.update_attributes!(:name => params[:user_name])
    rescue => e

           respond_to do |format|
                     format.html { }
                       format.js { }
                   end
    end
 end


 def update_password


             email        =  @user.email
             old_password =  params[:o_pass]

               if  User.verify_old_password(email,old_password)

               begin
                             @user.set_password(params[:n_pass], params[:cn_pass])
                             if @user.save!
                              @success_msg = "Password has been updated successfully"

                            respond_to do |format|
                                format.html { }
                                format.js { }
                                  end

                             end
#
#
#                                @user.update_attributes!(:password => params[:n_pass]  , :password_confirmation => params[:cn_pass])
               rescue => e

                            respond_to do |format|
                                format.html { }
                                format.js { }
                                  end
               end

               else
                            @incorrect_password = true
                            respond_to do |format|
                                        format.html { }
                                         format.js { }
                                     end
               end




 end

  def update_email

    # i have to check for existing email ids


   begin
          @user.update_attributes!(:email => params[:e_mail])
    rescue => e

           respond_to do |format|
                     format.html { }
                       format.js { }
                   end
    end
  end


def set_cuisines
@msg = "You have not selected any checkbox"
  if params[:user]
    
@msg = "Cusines has been updated successfuly "



if params[:user][:is_veg]
        @user.cuisines.clear
        @user.is_veg = true
        @user.save!
elsif params[:user][:cuisine_ids]

      if params[:user][:cuisine_ids].size == 3

       params[:user][:cuisine_ids].collect! {|item| item.to_i }

       cuisines_arry =    Cuisine.find(params[:user][:cuisine_ids])
       @user.cuisines.clear
       cuisines_arry.each do |cuisine|

         @user.cuisines << cuisine
       end
       @user.is_veg = false
       @user.save!
       else
         @msg = "Please select exactly  3 cuisines or select veg"

       end

else

       @user.cuisines.clear
       @user.is_veg = true
       @user.save!


end

  end
     respond_to do |format|
                     format.html { }
                       format.js { }
                   end
end


private

   def random_string(length=10)
        chars = 'abcdefghjkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ23456789'
        password = ''
        length.times { password << chars[rand(chars.size)] }
        password
    end

end
