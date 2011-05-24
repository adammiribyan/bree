class Category < ActiveRecord::Base
  has_ancestry
  has_many :services
  
  def roots
    self.is_root? == true
  end  
end
