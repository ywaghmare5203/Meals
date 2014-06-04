require 'net/http'
class ApiController < ApplicationController

  before_filter :api_authenticate, :only => [:user, :send_sms, :verify_sms, :place_order, :logout, :ccard, :redeem_points]
  skip_before_filter :verify_authenticity_token # bye bye security :)
  
  # gets the offers
  def offers
    cluster = Cluster.find_by_id(params[:cluster].to_i)
    cluster = Cluster.first if cluster.nil?
    ret = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
    ret += "<deals>\n"
    ret += "<cluster id=\"#{ cluster.id }\">#{ cluster.name }</cluster>\n"
    # @offers = get_offers
    @offers = Offer.last(10)
    @offers.each do |offer|
      ret += offer.xml
      ret += "\n\n"
    end
    ret += "\n</deals>\n"
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
    render(:text => ret)
  end

  def cuisines
    cuisines = Cuisine.all
    ret = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
    ret += "<cuisines>\n"
    cuisines.each do |c|
      ret += "<cuisine id=\"#{c.id}\">#{c.name}</cuisine>\n"
    end
    ret += "\n</cuisines>\n"
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
    render(:text => ret)

  end

  def login
    email = params[:email]
    password = params[:password]
    ret = ""
    u = User.auth(email, password)
    raise if u.nil?
    session[:user_id] = u.id
    session[:expires_at] = 14.days.from_now
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
    render(:text => "<?xml version=\"1.0\" encoding=\"UTF-8\"?><response><status>logged in</status></response>")
  rescue
    throw_xml_error
  end


  def logout
    session[:user_id] = nil
    reset_session
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
    render(:text => "<?xml version=\"1.0\" encoding=\"UTF-8\"?><response><status>logged out</status></response>")
  end


  def clusters
    # TODO: based on location
    @clusters = Cluster.all
    if request.post?      
    end
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
    ret = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"
    ret += "<clusters>\n"
    @clusters.each do |cluster|
      ret += cluster.xml
    end
    ret += "</clusters>"
    render(:text => ret)
  end
  

  def signup
    email = params[:email]
    if User.where(:email => email).size > 0
      ret = "<status>email exists</status>\n"
    else
      @user = User.create(:name => params[:name], :email => email, :cluster_id => params[:cluster], :phone => params[:phone])
      @user.set_password(params[:password])
      if @user.save
        session[:user_id] = @user.id
        session[:expires_at] = 14.days.from_now
        # create location
        loc = Location.new(:user_id => @user.id, :address => params[:address], :cluster_id => @user.cluster_id)
        if loc.save
          ret = "<status>ok</status>\n"
        else
          ret = "<status>user ok, address error</status>\n"
        end
      else
        raise      
      end
    end
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
    render(:text => "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<response>\n#{ret}</response>")
  rescue 
    throw_xml_error
  end

  def user
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
    if request.post?
      user = current_user
      user.name = params[:name] if params[:name]
      user.phone = params[:phone] if params[:phone]
      user.cuisines = params[:cuisines] if params[:cuisines]
      user.set_password(params[:password]) if params[:password]
      user.save
    end
    render(:text => "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<response>\n#{current_user.api_xml}</response>")
  end


  def place_order
    order = Order.new
    deal = Deal.find(params[:deal])
    raise unless deal.today_offer.nil?
    order.offer_id = deal.today_offer.id
    order.amount = params[:amount]
    raise unless order.amount > 0 
    order.user_id = current_user.id
    order.status = 0 # not processed yet
    order.save
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
    render(:text =>"<?xml version=\"1.0\" encoding=\"UTF-8\"?><response><order><id>#{order.id}</id><status>created</status></order><response>")
  rescue 
    throw_xml_error
  end

  # Cash on delivery
  # SMS calls
  def send_sms
    order = Order.find(params[:order])
    raise unless current_user.orders.include?(order) # if order belongs to user
    # generate random code
    chars = ("0".."9").to_a
    code = ""
    1.upto(4) { |i| code << chars[rand(chars.size-1)] }
    session[:sms_code] = code
    # send using SMS gateway
    raise if current_user.phone.empty?
    user = "ndrix"
    password = "71514809" 
    to = current_user.phone
    from = "iWannaEat"
    text = "Your iWannaEat code is #{code}."
    Net::HTTP.get_print 'www.smsglobal.com.au', "/http-api.php?action=sendsms&user=#{user}&password=#{password}&to=#{to}&from=#{from}&text=#{text}"
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
    render(:text =>"<?xml version=\"1.0\" encoding=\"UTF-8\"?><response><status>sent</status><response>")
  rescue 
    throw_xml_error
  end

  def verify_sms
    code = params[:code]
    order = Order.find(params[:order])
    raise unless current_user.orders.include?(order) # if order belongs to user
    raise unless code.eql?(session[:sms_code])
    session[:sms_code] = nil
    order.process
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
    render(:text =>"<?xml version=\"1.0\" encoding=\"UTF-8\"?><response><status>ok</status><response>") if order.save
  rescue 
    throw_xml_error
  end


  # WARNING!!! - This is a temp function to test iPhone interface
  def ccard 
    order = Order.find(params[:order])
    raise unless current_user.orders.include?(order) # if order belongs to user
    number = params[:number]
    ccv = params[:ccv]
    expiry_month = params[:expiry_month]
    expiry_year = params[:expiry_year]
    c = CreditCard.new(:number => number, :user_id => current_user.id, :ccv => ccv, :expiry_month => expiry_month, :expiry_year => expiry_year, :order_id => order.id)
    order.process
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
    render(:text =>"<?xml version=\"1.0\" encoding=\"UTF-8\"?><response><status>ok</status><response>") if (c.save && order.save)
  rescue 
    throw_xml_error
  end

  def redeem_points
    order = Order.find(params[:order])
    raise unless current_user.orders.include?(order) # if order belongs to user
    u = current_user
    u.points -= 20 # TODO: variable?
    order.status = 1
    order.save
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
    render(:text =>"<?xml version=\"1.0\" encoding=\"UTF-8\"?><response><status>ok</status><response>") if (u.save)
  rescue 
    throw_xml_error
  end

  def feedback
    order = Order.find(params[:order])
    raise unless current_user.orders.include?(order) # if order belongs to user # TODO: current order of today
    service = params[:service]
    food = params[:food]
    courtesy = params[:courtesy]
    cleanliness = params[:cleanliness]
    value_for_money = params[:value_for_money]
    comments = params[:comments]
    fb = Feedback.new(:order_id => order, 
      :service => service, 
      :food => food, 
      :courtesy => courtesy, 
      :cleanliness => cleanliness, 
      :value_for_money => value_for_money, 
      :comments => comments)
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
    render(:text =>"<?xml version=\"1.0\" encoding=\"UTF-8\"?><response><status>ok</status><response>") if (fb.save)
  rescue 
    throw_xml_error
  end

private

  # TODO: migrate with pages controller
  def get_offers
    unless logged_in?
      @offers = Offer.today_list(session[:cluster])
      # depending on location
    else
      @offers = current_user.offer_list
    end
  end

  def throw_xml_error
    response.headers["Content-Type"] = "application/xml; charset=utf-8"
    render(:text => "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<response>\n<status>error</status>\n</response>\n")
  end

end
