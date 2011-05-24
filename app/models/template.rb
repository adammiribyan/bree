class Template < ActiveRecord::Base
  default_scope :order => "created_at DESC"
  
  validates :name, :body, :presence => true
end
