class LineItem < ActiveRecord::Base
  belongs_to :service
  belongs_to :appointment
  
  delegate :name, :price, :to => :service
end
