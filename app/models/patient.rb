class Patient < ActiveRecord::Base
  mount_uploader :profile, DocumentUploader
  
  has_one :teeth_chart
  has_many :comments
  has_many :appointments
  has_many :doctors, :through => :appointments  

  # FIXME: Bith days initial reminder scope
  scope :birthdays, where("DAY(birth_date) = ?", Time.now.day).where("MONTH(birth_date) = ?", Time.now.month)

  def abbreviated_name
    "#{self.last_name} #{self.first_name[0]}.#{self.middle_name[0]}."
  end
end