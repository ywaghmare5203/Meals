class DMeal < ActiveRecord::Base
  belongs_to :restaurant, :class_name => "DRestaurant"
  belongs_to :meal # original
  belongs_to :cuisine
  acts_as_taggable_on :tags
  validates_presence_of :name, :cuisine_id # , :price
  has_attached_file :photo, :styles => { :big => "437x354!", :thumb => "128x104!",  :mobile => "208x225!" },
     :path => ":rails_root/public/meals_pics/:style/:filename",
 :url => "/meals_pics/:style/:filename"

  def owner
    Admin.find(self.owner_id)
  end

  def approved?
    self.status.eql?(1)
  end

end
