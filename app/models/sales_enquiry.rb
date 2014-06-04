class SalesEnquiry < ActiveRecord::Base
  attr_accessible  :name,:your_name,:owner_name, :email,:address1,:address2,:zip_code,:phone, :website,:delivery_staff ,:order_day,:combo_meals,:primary_cuisine,:home_delivery,:admin_id ,:status

validates_presence_of :name,:your_name,:owner_name, :email,:address1,:address2,:zip_code,:phone, :website,:delivery_staff ,:order_day,:combo_meals,:primary_cuisine,:home_delivery,:admin_id ,:status
end
