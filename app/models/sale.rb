class Sale < ActiveRecord::Base
  belongs_to :cluster

 attr_accessible  :restaurant_name, :address1, :address2, :zip_code, :phone ,:website ,:point1_name,:point1_email, :point1_mobile ,:point2_name, :point2_email ,:point2_mobile, :lat ,:lng ,:about_meal, :cluster_id
end
