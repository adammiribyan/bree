class User < ActiveRecord::Base
  attr_accessible :password
  has_secure_password
  validates_presence_of :password
end
