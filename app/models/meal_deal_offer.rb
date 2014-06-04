class MealDealOffer < ActiveRecord::Base
	
 validates_presence_of :target, :message => 'Please fill the target'

end
