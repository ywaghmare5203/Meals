class Role < ActiveRecord::Base
  has_many :admins
end
