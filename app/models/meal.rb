class Meal < ActiveRecord::Base
  attr_accessible  :name, :cuisine_id, :description, :meal_info, :deal_tag, :nutr_carbs, :nutr_calories, :nutr_protein, :nutr_sodium,:nutr_cholestrol, :nutr_fats
#    validates_presence_of :name, :message=> "Can not be blank"
#  validates_presence_of :cuisine_id, :message=> "Select cuisine"
#  validates_presence_of :description, :message=> "Can not be blank"
#  validates_presence_of :meal_info , :message=> "Can not be blank"
#  validates_presence_of :deal_tag, :message=> "Can not be blank"
#  validates_presence_of :nutr_carbs, :message=> "Can not be blank"
#  validates_presence_of :nutr_calories, :message=> "Can not be blank"
#  validates_presence_of :nutr_protein, :message=> "Can not be blank"
#  validates_presence_of :nutr_sodium, :message=> "Can not be blank"
#  validates_presence_of :nutr_cholestrol, :message=> "Can not be blank"
#  validates_presence_of :nutr_fats, :message=> "Can not be blank"
  belongs_to :restaurant
  belongs_to :cuisine
  has_many :offers

  acts_as_taggable_on :tags
#validates_presence_of :name, :cuisine_id, :description, :meal_info, :deal_tag, :nutr_carbs, :nutr_calories, :nutr_protein, :nutr_sodium,:nutr_cholestrol, :nutr_fats, :message => "can't be blanck"
#validates_format_of :picture, :allow_blank => false,
                     #:with    => %r{\.(jpeg)$}i,
                      #:message => ': Please only jpeg.'
 
 # validates :name, :presence => true
   has_attached_file :picture, :styles => { :big => "437x354!", :thumb => "128x104!", :mobile => "208x225!" },
 
  :path => ":rails_root/public/system/restaurant_pics/:restaurant_id/:style/:filename",
  :url => "/system/restaurant_pics/:restaurant_id/:style/:filename"
  
 
 Paperclip::Attachment.interpolations[:restaurant_id] = proc do |attachment, style|
  restaurant_id= Restaurant.find(attachment.instance.restaurant_id).admin_id
end
  def today_offer
    return Offer.where(:meal_id => self.id, :yday => Time.now.yday).first # should be only one
  end

end
