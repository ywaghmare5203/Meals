require 'digest/sha1'
class User < ActiveRecord::Base

# before_save :prepare_password



 attr_accessor   :password_confirmation



  validates_uniqueness_of :email
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "Invalid email"
  validates_length_of :password, :minimum => 3, :message => "password must be at least 3 characters long", :if => :password
  validates_confirmation_of :password, :message => "should match confirmation", :if => :password
 validates_numericality_of :phone, :integer_only => true ,:message => "Invalid "
 validates_numericality_of :po, :integer_only => true, :message => "Invalid "
 validates_numericality_of :zipcode, :integer_only => true, :message => "Invalid "



  has_many :orders
  has_many :locations
  belongs_to :cluster
  has_and_belongs_to_many :cuisines

  acts_as_taggable_on :tags

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
#  def offer_list
#
#    # all valid ones for today (TODO: made timezone specific)
#
#    @ret = Offer.today_list # .collect{ |x,y| x.meal.name <=> y.meal.name }
#    @ret = Offer.today_list(self.cluster_id) # .collect{ |x,y| x.meal.name <=> y.meal.name }
#    h = Hash.new
#    my_deals = @ret.map{ |x| x.deal }
#    my_deals.each do |d|
#      h[d] = 0 # init
#      h[d] += 10 if self.ordered_meals.include?(d.meal)
#
#      # order history (cuisine, ingredients, ...)
#      self.ordered_meals.each do |meal|
#        h[d] += 5 if meal.cuisine.eql?(d.meal.cuisine)
#      end
#
#      all_tags = self.ordered_meals.map{ |x| x.tag_list.to_s }
#      all_tags.each do |c|
#        h[d] += 2 if d.meal.tag_list.include?(c)
#      end
#
#      # preferences
#
#    end
#
#    # sort hash on values
#    h.sort { |a, b| b[1] <=> a[1] }
#
#    # filter out the ones out of delivery areas
#
#    # send todays' offers of only the deals (the hash's keys)
#    a = h.keys.map{|x| x.today_offer }
#
#
#
#    if  self.cuisines.size == 0 &&  !is_veg?
#
#      general_offer_array = []
#      Cuisine.all.each do |cuisine|
#            a.each do |offer|
#               if  offer.deal.meal.cuisine_id == cuisine.id
#                   general_offer_array << offer
#                   break
#               end
#            end
#         end
#            return general_offer_array.reverse
#    else
#
#     if is_veg?
#         a.select!{|offer| offer.deal.meal.vegetarian == true }
#     else
#         a.select!{|offer| self.cuisine_ids.include?(offer.deal.meal.cuisine_id) }
#     end
#         return a.reverse
#     end
#
#  end

 def offer_list

    # all valid ones for today (TODO: made timezone specific)

    #@ret = Offer.today_list # .collect{ |x,y| x.meal.name <=> y.meal.name }
    @ret = Offer.today_list(self.cluster_id) # .collect{ |x,y| x.meal.name <=> y.meal.name }
    h = Hash.new
    my_deals = @ret.map{ |x| x.deal }
    my_deals.each do |d|
      h[d] = 0 # init
      h[d] += 10 if self.ordered_meals.include?(d.meal)

      # order history (cuisine, ingredients, ...)
      self.ordered_meals.each do |meal|
        h[d] += 5 if meal.cuisine.eql?(d.meal.cuisine)
      end

      all_tags = self.ordered_meals.map{ |x| x.tag_list.to_s }
      all_tags.each do |c|
        h[d] += 2 if d.meal.tag_list.include?(c)
      end

      # preferences

    end

    # sort hash on values
    h.sort { |a, b| b[1] <=> a[1] }

    # filter out the ones out of delivery areas

    # send todays' offers of only the deals (the hash's keys)
    a = h.keys.map{|x| x.today_offer }

   if self.cuisines.size == 0 &&  !is_veg?

   general_offer_array = []

   offers_with_cuisine = []

   Cuisine.all.each do |cuisine|
       arr = a.select{ |offer| offer.deal.meal.cuisine_id == cuisine.id}
       offers_with_cuisine << arr.reverse!
   end

   number_of_bunch = (a.length/6.0).ceil

   number_of_bunch.times{

   offers_bunch = []
   Cuisine.all.length.times do |i|
     offers_bunch <<  offers_with_cuisine[i].pop
   end


  offers_with_cuisine.flatten.size.times {

  offers_bunch.compact!

  if offers_bunch.size < 6 && offers_with_cuisine.flatten.size > 0

     offers_with_cuisine.sort! { |x,y| x.size <=> y.size }

     offers_bunch << offers_with_cuisine.last.pop
 else
          break
 end
}


   general_offer_array << offers_bunch

  }


  # This is the seen for cluster 3
  # offers_with_cuisine------------[[], [], [], [], [], [#<Offer id: 30, deal_id: 30, maximum_order: 14, created_at: "2012-02-07 08:09:41", updated_at: "2012-02-07 08:09:41", status: 2, yday: 104>, #<Offer id: 29, deal_id: 29, maximum_order: 14, created_at: "2012-02-07 08:09:41", updated_at: "2012-02-07 08:09:41", status: 2, yday: 104>, #<Offer id: 28, deal_id: 28, maximum_order: 14, created_at: "2012-02-07 08:09:41", updated_at: "2012-02-07 08:09:41", status: 2, yday: 104>, #<Offer id: 27, deal_id: 27, maximum_order: 14, created_at: "2012-02-07 08:09:41", updated_at: "2012-02-07 08:09:41", status: 2, yday: 104>, #<Offer id: 26, deal_id: 26, maximum_order: 9, created_at: "2012-02-07 08:09:41", updated_at: "2012-02-07 08:09:41", status: 2, yday: 104>]]


    return general_offer_array




#      return general_offer_array.reverse


   else
     if is_veg?


        a.select!{|offer| offer.deal.meal.vegetarian == true }
        my_offers_list = []

        number_of_bunch = (a.length/6.0).ceil

       number_of_bunch.times{

        offer_bunch = []

        6.times{
               offer_bunch <<  a.pop
               break if a.size < 1
        }




        my_offers_list    << offer_bunch


        }

       return my_offers_list


     else

       a.select!{|offer| self.cuisine_ids.include?(offer.deal.meal.cuisine_id) }
       offers_with_cuisine = []
       my_offers_list = []

        self.cuisine_ids.each do |cusine_id|

         arr = a.select{|offer|  offer.deal.meal.cuisine_id == cusine_id  }

         offers_with_cuisine << arr.reverse!

       end


       number_of_bunch = (a.length/6.0).ceil

 number_of_bunch.times{
        offer_bunch = []
        (0..2).each {|i|
          arr1 = []

          arr1   <<  offers_with_cuisine[i].pop
          arr1   <<  offers_with_cuisine[i].pop
         offer_bunch << arr1
        }
         my_offers_list    << offer_bunch


 }


     return     my_offers_list
#        a.select!{|offer| self.cuisine_ids.include?(offer.deal.meal.cuisine_id) }
     end

#    return a.reverse

    end



  end
  
  def is_veg?

    return self.is_veg

  end


  def deliver_address

    if self.locations.size < 1
      return nil
    end

    primary = self.locations.where(:primary_address => true)

    if primary.size > 0
      return  primary.first

    else
      return  self.locations.first
    end


  end








  # User auth stuff

  def self.auth(email, password)
    return nil  if (email.nil? or password.nil?)
    u = User.where("email LIKE ?", email).limit(1).first
    return nil if u.nil?
    s = u.hash # to beat rails' fucking lazy loading
    db_hash = u.hash.to_s
    db_pass = u.password.to_s

    if u.email
      hashed_password = Digest::SHA1.hexdigest(password.to_s + db_hash)
      return u if(db_pass == hashed_password)
    end
    return nil

  end


   def self.verify_old_password(email,password)

     return nil  if (email.nil? or password.nil?)
    u = User.where("email LIKE ?", email).limit(1).first
    return nil if u.nil?
    s = u.hash # to beat rails' fucking lazy loading
    db_hash = u.hash.to_s
    db_pass = u.password.to_s

    if u.email
      hashed_password = Digest::SHA1.hexdigest(password.to_s + db_hash)
      return u if(db_pass == hashed_password)
    end
    return nil

  end

  def prepare_password
    self.hash = self.create_hash_new if (self.hash.nil? || self.hash.empty?)
    self.password = Digest::SHA1.hexdigest(self.password.to_s + self.hash.to_s)
  end


#  def set_password(password)
#    self.create_hash if (self.hash.nil? || self.hash.empty?)
#    self.password = Digest::SHA1.hexdigest(password.to_s + self.hash.to_s)
#  end




  def set_password(password , conferm_password)
    self.hash = self.create_hash_new if (self.hash.nil? || self.hash.empty?)
    #    self.create_hash if (self.hash.nil? || self.hash.empty?)
    self.password = Digest::SHA1.hexdigest(password.to_s + self.hash.to_s)
    self.password_confirmation = Digest::SHA1.hexdigest(conferm_password.to_s + self.hash.to_s)
  end

  
  def set_forgot_password(password)
    self.create_hash if (self.hash.nil? || self.hash.empty?)
    self.password = Digest::SHA1.hexdigest(password.to_s + self.hash.to_s)
  end




  # array of all meals ever ordered by user
  def ordered_meals
    self.orders.collect{ |x| x.offer.deal.meal }
  end

  def api_xml
    ret = "<user>\n" +
          "  <name>#{self.name}</name>\n" +
          "  <email>#{self.email}</email>\n" +
          "  <phone>#{self.phone}</phone>\n" +
          "  <points>#{self.points}</points>\n" +
          "  <locations>\n"
    self.locations.each do |loc|
      ret +=  "<location>\n"
              "  <name>#{loc.name}</name>\n" +
              "  <address>#{loc.address}</address>\n" +
              ("  <current>true</current>\n" if loc.id.eql?(self.current_location)) +
              "</location>\n"
    end
    ret+= "  </locations>\n  <cuisines>\n"
    self.cuisines.to_s.split(",").each do |cid|
      cuisine = Cuisine.find_by_id(cid)
      ret += "<cuisine><name>#{cuisine.name}</name></cuisine>\n"
    end
    ret+= "  </cuisines>\n</user>\n"
    return ret
  end



  def send_new_password(new_pass)
    self.password = self.password_confirmation = new_pass
    self.save
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

  def create_hash_new
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(16) { |i| newpass << chars[rand(chars.size-1)] }
#    self.hash = newpass
#    self.save
    return newpass
  end


end
