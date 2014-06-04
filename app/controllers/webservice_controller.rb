class WebserviceController < ApplicationController

  def getallclusters
    @clusters = Cluster.all

    respond_to do |format|
    format.xml {render :xml => @clusters }
    end
  end

  def todaysdeal
    @clusters = Cluster.all
    @cluster = Cluster.find(params[:id])
    session[:cluster_id] = params[:id].to_i
    @offers_outer_array =  get_todays_offers
    @offers = @offers_outer_array.paginate(:page => params[:page],:per_page => params[:per_page] || 1)

      respond_to do |format|
        format.xml {render :xml => @offers}
      end

  end

  def cluster
  cluster = Cluster.all
  ret = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
  ret = "<clusters>"

  cluster.each do |c|
    ret += "<cluster id=\"#{c.id}\">\n<name>#{c.name}</name>\n</cluster>\n"
  end
  ret += "\n</clusters>\n"
  response.headers["Content-Type"] = "application/xml; charset=utf-8"
  render(:text => ret)
end

  def todaysdealoffer
    @clusters = Cluster.all
    @cluster = Cluster.find(params[:id])
    session[:cluster_id] = params[:id].to_i
    @offers_outer_array =   get_todays_offers
    @offers  =  @offers_outer_array.paginate(:page => params[:page],:per_page => params[:per_page] || 1)

      respond_to do |format|
      format.xml { render xml: @offers}
      end

  end

  def get_todays_offers

     cluster_id = session[:cluster_id]

     Offer.today_offer_list(cluster_id)

  end

  def web_cusines
    cuisines = Cuisine.all

    ret = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
    ret += "<cuisines>\n"
    cuisines.each do |c|
      ret += "<cuisine id=\"#{c.id}\">\n<name>#{c.name}</name>\n</cuisine>\n"
    end
    ret += "\n</cuisines>\n"
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
    render(:text => ret)
  end




  def web_Dmeal
    @meal = DMeal.all

      respond_to do |format|

      format.xml { render xml: @meal}
      end
  end

  def offers
begin
    @cluster = Cluster.find(params[:id])

    meal = DMeal.all
rescue=>e
end

    ret = "<?version=\"1.0\"encoding=\"UTF-8\"?>\n"
    ret = "<deals>"
    meal.each do |m|
          begin
      ret += "<cluster id=\"#{@cluster.id}\">\n \"#{@cluster.name}\"</cluster>"
      ret += "<deal id=\"#{m.id}\">\n"
      ret += "<meal>\n"
      ret += "<name>\"#{m.name.gsub("'","").gsub("&","and")}\"</name>\n"
      ret += "<price>\"#{m.price}\"</price>\n"
      ret += "<description>\"#{m.description}\"</description>\n"
      ret += "<photo>\"#{m.photo_file_name}\\#{m.photo_content_type}\\#{m.photo_file_size}\"</photo>\n"
      ret += "<nutrition>\n"
      ret += "<calories>\"#{m.nutr_calories}\"</calories>\n"
      ret += "<fats>\"#{ m.nutr_fats}\"</fats>\n"
      ret += "<sodium>\"#{m.nutr_sodium}\"</sodium>\n"
      ret += "<protein>\"#{m.nutr_protein}\"</protein>\n"
      ret += "<carbs>\"#{m.nutr_carbs}\"</carbs>\n"
      ret +="</nutrition>\n"
      ret +="</meal>\n"
      ret +="<reataurant>\n"
      ret +="<name>"+getinforeturnant(m.restaurant_id).name+"</name>\n"# i have to work here
      ret +="<description>"+getinforeturnant(m.restaurant_id).description+"</description>\n"
      ret +="<cuisine>"+getinforeturnant(m.restaurant_id).cuisine.name+"</cuisine>\n"
      ret +="<latitude>"+getinforeturnant(m.restaurant_id).lat.to_s+"</latitude>\n"
       ret +="<longitude>"+getinforeturnant(m.restaurant_id).lng.to_s+"</longitude>\n"

      ret +="</reataurant>\n"
    #  ret +="<ending soon></ending soon>\n"
      ret += "</deal>"
    rescue=> e
    end

    end

    ret += "\n</deals>\n"
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
    render(:text => ret)
  end




  def throw_xml_error
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
    render(:text => "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<response>\n<status>error</status>\n</response>\n")
  end




  def web_user
    @user = User.find(params[:id])
      respond_to do |format|
      format.xml {render xml: @user}
    end
  end




  def delivery_loction
    username = params[:first_name]
    puts username+"fdgsssssssssssssssss"
    @location = Location.all
    # ret ="<?xml version=\"1.0\"encoding=\"UTF-8\"?>"
    # ret +="<location>"
     @location.each do |l|
    #   ret += "<address>#{l.address1}+#{address2}</address>\n"
         @my= l.address_line1 if l.first_name == username
     end
     respond_to do |format|
      format.xml {render xml: @my}
    end
    # ret +="</locaion>"
    # response.headers["Content-Type"] = "application/xml; charset=utf-8"
    # render(:text => ret)
  end

  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end








  def getallclusters
    @clusters = Cluster.all

    respond_to do |format|

    format.xml { render xml: @clusters }
    end
  end

  def getclusteroffer

    @clusters = Cluster.all
    web = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
    web += "<Made_by_MR_ARVIND>\n"
    @clusters.each do |c|
      web += "<offers_id =\"{c.id}\">\n""<offer_name= \"#{c.name}\">\n"
    end
    web += "\n</Made_by_MR_ARVIND>\n"
    response.headers["Content-Type"] = "application/xml; charset = utf-8"
    render(:text => web)
  end

  def todaysdeal
    @clusters = Cluster.all
    @cluster = Cluster.find(params[:id])
    session[:cluster_id] = params[:id].to_i
    @offers_outer_array =   get_todays_offers
    @offers  =  @offers_outer_array.paginate(:page => params[:page],:per_page => params[:per_page] || 1)

      respond_to do |format|
      format.xml { render xml: @offers}
      end

  end

  def get_todays_offers

     cluster_id = session[:cluster_id]

     Offer.today_offer_list(cluster_id)

  end

  def web_cusines
    cuisines = Cuisine.all

    ret = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
    ret += "<cuisines>\n"
    cuisines.each do |c|
      ret += "<cuisine id=\"#{c.id}\">\n<name>#{c.name}</name>\n</cuisine>\n"
    end
    ret += "\n</cuisines>\n"
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
    render(:text => ret)
  end

  def updateuser
    @user = User.where(:id => params[:user_id])
    @user.update_all(:password => params[:password].to_i ,:name => params[:name],:phone => params[:phone].to_i,:cuisines=>params[:cuisines])
      respond_to do |format|
        format.xml { render xml: @user}
      end
  end


  def web_user
    @user = User.find(params[:id])
    respond_to do |format|
      format.xml {render xml: @user}
    end
  end


  def cuisines
    cuisines = Cuisine.all
    ret = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
    ret += "<cuisines>\n"
    cuisines.each do |c|
      ret += "<cuisine id=\"#{c.id}\">\n<name>#{c.name}</name>\n</cuisine>\n"
    end
    ret += "\n</cuisines>\n"
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
    render(:text => ret)

  end



      def web_login
        email = params[:email]

        password = params[:password]
        ret = ""
        u = User.find_by_email(params[:email])

        raise if u.nil?
          session[:user_id] = u.id
          session[:expires_at] = 14.days.from_now
          response.headers["Content-Type"] = "application/xml; charset=utf-8"
          render(:text => "<?xml version=\"1.0\" encoding=\"UTF-8\"?><response>\n<status>Success</status>\n<user_id>#{u.id}</user_id>\n<user_location>#{u.current_location}</user_location>\n</response>")
        rescue
        throw_xml_error
      end 


  def web_logout
     user_id = params[:user_id]
    session[:user_id] = nil
    reset_session
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
    render(:text => "<?xml version=\"1.0\" encoding=\"UTF-8\"?><response>\n<status>Success</status>\n</response>")
   end


  def add_location
    @location = Location.new
    @location.user_id=params[:user_id]
    @location.first_name=params[:first_name]
    @location.address_line1=params[:address_line1]
    @location.address_line2=params[:address_line2]
    @location.state=params[:state]
    @location.city =params[:city]
    @location.zipcode=params[:zipcode]
    if @location.save
      render(:text => "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<response>Success</response>")
    else
      render(:text => "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<response>Error</response>")
    end

  end
    def throw_xml_error
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
    render(:text => "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<response>\n<status>error</status>\n</response>\n")
  end

  def web_singup
    email = params[:email]
    if User.where(:email => email).size > 0
      ret = "<status>email exists</status>\n"
    else
        @user = User.new
        #@user.name = params[:name]
       @user.email = email

       @user.password = params[:password]
       @user.name=params[:name]
       @user.cluster_id = params[:cluster_id]
       @user.address = params[:address]
       @user.current_location=params[:current_location]
       @user.street = params[:street]
       @user.zipcode = params[:zipcode]
       @user.phone = params[:phone]
       @user.po = params[:po]


      if @user.save
         ret ="<status>Success</status>\n<user>#{@user.id}</user>\n"
        else
          ret = "<status>user ok, address error</status>\n"
        end
       end
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
    render(:text => "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<response>#{ret}</response>")
   end

  def myuserweb
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
    if request.post?
      user = current_user
      user.name = params[:name] if params[:name]
      user.address = params[:address] if params[:address]
      user.zipcode = params[:zipcode] if params[:zipcode]
      user.street = params[:street] if params[:street]
      user.phone = params[:phone] if params[:phone]

      user.cuisines = params[:cuisines] if params[:cuisines]
      user.set_password(params[:password]) if params[:password]
      user.save
    end
    render(:text => "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<response>\n#{current_user.api_xml}</response>")
  end

  def location

    
    user_id = params[:user_id]
    @location = Location.find_all_by_user_id(user_id)

    if @location.size == 0
      @status="<errors><status>No Location found</status></errors>"
    else
      @status=@location

    end
      respond_to do |format|
      format.xml {render xml: @status}
      end


  end


  private
  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end



  def getinforeturnant(id)
   
    restaurant=Restaurant.find(id)
    restaurant

 end

end
