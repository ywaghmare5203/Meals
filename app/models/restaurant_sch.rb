class RestaurantSch < ActiveRecord::Base
	belongs_to :restaurant
	 #before_save :check_for_dateSchedule
	validates_presence_of :date,:message => "please select date"
    validates_presence_of :status, :message=> "please select status"
    validates_presence_of :quantity,:message=> "please select quantity"
    validates_presence_of :dish_id, :message=> "please select dish"
	 
	end
