class User < ActiveRecord::Base
  attr_accessible :password
  has_secure_password
  validates_presence_of :password
  
  def update_password(length = 5)
    length = length.to_i
    new_password = generate_random_password(length)
    
    if self.update_attribute(:password, new_password)
      return new_password
    else
      nil
    end
  end
  
  private
  
    def generate_random_password(length)
      password = ""
      chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a   
      1.upto(length) { |i| password << chars[rand(chars.size-1)] }
      
      return password
    end
end
