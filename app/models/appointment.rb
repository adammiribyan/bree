class Appointment < ActiveRecord::Base
  belongs_to :patient
  belongs_to :doctor
  
  has_many :line_items, :dependent => :destroy
  
  default_scope :order => "created_at DESC"
  
  def add_service(service_id)
    current_item = line_items.find_by_service_id(service_id)
    
    if current_item
      current_item.quantity += 1
    else
      current_item = line_items.build(:service_id => service_id)      
    end
    
    current_item
  end
end
