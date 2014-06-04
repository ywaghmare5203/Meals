class Superuser < ActiveRecord::Base

  validates_presence_of :email, :role_id
  validates_uniqueness_of :email,  :presence => true

  has_many :restaurants
  belongs_to :role
  belongs_to :city
  belongs_to :admin
 has_many :restaurants, :dependent => :destroy
validates_presence_of :email, :role_id

  def self.auth(email, password)
    return nil  if (email.nil? or password.nil?)
    u = Admin.where("email LIKE ?", email).limit(1).first
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
		logger.info(" - Password changed for #{self.email}")
  end

  def owner?
    return self.role_id.to_i.eql?(0)
  end

  def copywriter?
    # return self.role_id.to_i > 0
    return self.role_id.to_i.eql?(1)
  end

  def admin?
    return self.role_id.to_i.eql?(2)
    # return self.role_id.to_i > 1
  end

  # country heads
  def manager?
    return self.role_id.to_i.eql?(3)
    # return self.role_id.to_i > 2
  end

  # god
  def superuser?
    return self.role_id.to_i > 3
  end

	def role
		return Admin.roles[self.role_id]
	end

  def self.roles
    return ["Owner", "Copywriter", "Admin", "Manager", "SuperUser"]
  end

  def owns_restaurant?(r)
    admin_city = (self.admin? && r.admin.city_id.eql?(self.city_id))
    return self.restaurants.include?(r) || admin_city || self.superuser?
  end

  def edit_restaurant?(r)
    (r.admin.city_id.eql?(self.city_id) || self.manager? || self.superuser? )
  end

  def edit_drestaurant?(d)
    return d.admin_id.eql?(self.id)
  end

  def dashboard
    return "/admin"
  end

  def check_admin_password(hash,old_pass,current_password)
 hashed_password = Digest::SHA1.hexdigest(old_pass.to_s + hash)
 return true if(current_password == hashed_password)
end

def admin_set_password(password)

  self.create_hash if (self.hash.nil? || self.hash.empty?)
   self.password = Digest::SHA1.hexdigest(password.to_s + self.hash.to_s)
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


end
