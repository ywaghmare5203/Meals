require 'digest/sha1'
class UserModel < ActiveRecord::Base
  validates_uniqueness_of :email
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email"

  # has_many :restaurants
  # has_many :orders
  # belongs_to :city

  def self.auth(email, password)
    return nil  if (email.nil? or password.nil?)
    u = User.where("email LIKE ?", email).limit(1).first
    return nil if u.nil?
    s = u.hash # to beat rails' fucking lazy loading
    db_hash = u.hash.to_s
    db_pass = u.password.to_s

    if u.email
      hashed_password = Digest::SHA1.hexdigest(password.to_s + db_hash)
      if(db_pass == hashed_password)
        return u
      end
    end
    return nil 

  end

  def set_password(password)
    self.create_hash if (self.hash.nil? || self.hash.empty?)
    self.password = Digest::SHA1.hexdigest(password.to_s + self.hash.to_s)
  end

  # checks if current user "owns" the restaurant
  def owner?(restaurant)
    return self.id.eql?(Restaurant.find(restaurant.id).owner_id)    
  end

  # if the user owns any restaurants
  def owns_restaurants?
    return (Restaurant.where("owner_id = ?", self.id).size > 0) # true if it has restaurants
  end


  def today_orders
    today = Date.today
    orders = []
    self.orders.each do |o|
      orders << o if o.created_at.yday.eql? today.yday
    end
    return orders
  end

  # magical algorithm - calculates the best food list, and returns an array of meals
  #                     based on food preferences, ratings, etc..
  # 
  #                     This belongs to a user object, and does
  def offer_list
    weekday = Time.now.wday # TODO: location
    @ret = Offer.where("status = 1 AND weekday = ?", weekday).last(5)
    return @ret
  end


protected

  def create_hash
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(16) { |i| newpass << chars[rand(chars.size-1)] }
    self.hash = newpass
    self.save
    return newpass
  end
  
end
