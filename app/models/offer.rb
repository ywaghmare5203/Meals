class Offer < ActiveRecord::Base
  belongs_to :deal
  has_many :orders

  def valid_orders
    orders = Order.where("offer_id = ?", self.id).all
    orders.each do |o|
#      orders -= [o] unless o.created_at.yday.eql?(Date.today.yday)
    end
    return orders
  end

  def remaining
    return (self.maximum_order - self.valid_orders.count)
  end

  # can we order this today
  #TODO : parse user timezone
  def valid_today?
    today = Date.today
    return self.yday.eql?(today.yday)
  end


   def self.today_offer_list(cluster_id)

  all_offers = Offer.where(:yday => 104, :status => 2) # all valid, approved orders

    my_offers = []
    my_offers_list = []
    all_offers.each do |offer|
      # only show offers in my cluster
      begin
      my_offers << offer if offer.deal.restaurant.cluster_id.eql?(cluster_id)
      rescue=>e
      end
    end


   offers_with_cuisine = []

   Cuisine.all.each do |cuisine|
     
       arr = my_offers.select{ |offer| offer.deal.meal.cuisine_id == cuisine.id}

     offers_with_cuisine << arr.reverse!
     
     
   end

   number_of_bunch = (my_offers.length/6.0).ceil

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


   my_offers_list << offers_bunch

  }




    return my_offers_list

 end




  def self.today_list(cluster_id)    
  # all_offers = Offer.where(:yday => Time.now.yday, :status => 2) # all valid, approved orders

    all_offers = Offer.where(:yday => 104, :status => 2) # all valid, approved orders
    my_offers = []
    all_offers.each do |offer|
      # only show offers in my cluster
      my_offers << offer if offer.deal.restaurant.cluster_id.eql?(cluster_id)
    end
    return my_offers
  end

  def xml
    # if self.valid_today? 
    if true 
      return  "<deal id=\"#{self.deal.id}\">\n" + 
              "  <meal>\n" + 
              "    <name>#{self.deal.meal.name}</name>\n" + 
              "    <price>#{self.deal.meal.price}</price>\n" + 
              "    <description>#{self.deal.meal.description}</description>\n" + 
              "    <photo>#{self.deal.meal.photo(:iphone)}</photo>\n" + 
              "    <nutrition>\n" + 
              "      <calories>#{ self.deal.meal.nutr_calories}</calories>\n" + 
              "      <cholesterol>#{ self.deal.meal.nutr_cholesterol}</cholesterol>\n" + 
              "      <fats>#{ self.deal.meal.nutr_fats}</fats>\n" + 
              "      <sodium>#{ self.deal.meal.nutr_sodium}</sodium>\n" + 
              "      <protein>#{ self.deal.meal.nutr_protein}</protein>\n" + 
              "      <carbs>#{ self.deal.meal.nutr_carbs}</carbs>\n" + 
              "    </nutrition>\n" + 
              "  </meal>\n" + 
              "  <restaurant>\n" + 
              "    <name>#{self.deal.restaurant.name}</name>\n" + 
              "    <description>#{self.deal.restaurant.description}</description>\n" + 
              "    <cuisine>#{self.deal.restaurant.cuisine.name }</cuisine>\n" + 
              "    <latitude>#{self.deal.restaurant.lat}</latitude>\n" + 
              "    <longitude>#{self.deal.restaurant.lng}</longitude>\n" +
              "  </restaurant>\n" +
              "  <endingsoon>#{ (self.valid_orders.size > 10).to_s }</endingsoon>\n" + 
              "</deal>"        
    else
      return "<false/>" 
    end
  end
  

end
