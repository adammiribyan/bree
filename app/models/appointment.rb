class Appointment < ActiveRecord::Base
  belongs_to :patient
  belongs_to :doctor
  
  has_many :line_items, :dependent => :destroy
end
