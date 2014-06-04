class Career < ActiveRecord::Base

  attr_accessible :name, :email, :file

  validates_presence_of :name, :email, :file

  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => ": Invalid email"

  validates_format_of :file, :allow_blank => false,
                      :with    => %r{\.(pdf)$}i,
                      :message => ': Please select only PDF file.'


end
