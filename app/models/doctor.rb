class Doctor < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  
  has_many :appointments
  has_many :patients, :through => :appointments
  
  def full_name
    "#{self.last_name} #{self.first_name} #{self.middle_name}"
  end
  
  def abbreviated_name
    "#{self.last_name} #{self.first_name[0]}.#{self.middle_name[0]}."
  end
  
  def self.collection
    Doctor.all.map do |d|
      id = d.id
      name = d.full_name      
    end
  end
end
