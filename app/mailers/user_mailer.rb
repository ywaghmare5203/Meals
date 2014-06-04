class UserMailer < ActionMailer::Base

default :from => "ror.arvindvyas@gmail.com"
  def approved_request(admin)
    @admin = admin
   
     @restaurant = admin.restaurants.first
    mail(:to => @admin.email, :subject => "Meeldeel request approved")
  end

  def request_created(admin)
    @admin = admin
     puts "================Herere=========================#{admin.id}"
    @restaurant=Restaurant.find_by_admin_id(admin.id)
    #@restaurant = admin.restaurants.first
    mail(:to => @admin.email, :subject => "Meeldeel request submitted")
  end

  def approved_restaurant(restaurant)
    @restaurant = restaurant
    mail(:to => restaurant.admin.email, :subject => "Restaurant approved")
  end


  def ping(user)
    @user = user
    mail(:to => user.email, :subject => "Lunch choices are ready!")
  end

  def feedback(order)
    @order = order
    mail(:to => order.user.email, :subject => "How was lunch?")
  end


  def password_confermation(email , password)

    mail(:to => email, :subject => "Forgot password email" , :body => "Your new password is #{password} , you can reset it after login" )
  end
  def addcomment(add_comment)
puts "this is mailer"
    comment_restaurant = add_comment[0]
    restaurant = add_comment[1]
    
    mail(:to => "#{restaurant} ",:subject=>"this is the request by restaurant owner",:body=>comment_restaurant)
  end
  
  def send_message(send_message)
    message = send_message
    mail(:to => "#{send_message[1].point1_email}",:subject=>"this is the request by manager regarding your meal target",:body=> message[0])

end
end
