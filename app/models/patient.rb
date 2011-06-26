# encoding: utf-8

class Patient < ActiveRecord::Base
  mount_uploader :profile, DocumentUploader
  
  has_one :teeth_chart
  has_many :comments
  has_many :appointments
  has_many :doctors, :through => :appointments  

  def abbreviated_name
    "#{self.last_name} #{self.first_name[0]}.#{self.middle_name[0]}."
  end
  
  def latest_appointments
    self.appointments.order("created_at DESC").limit(10) if self.appointments
  end
  
  def age
    now = Time.now.utc.to_date    
    age = now.year - self.birth_date.year - (self.birth_date.to_date.change(:year => now.year) > now ? 1 : 0)
    declinated_name = Russian.p(age, "год", "года", "лет")
    
    "#{age} #{declinated_name}".html_safe
  end
  
  class << self
    def has_birthday_today
      where("DAY(birth_date) = ?", Time.now.day).where("MONTH(birth_date) = ?", Time.now.month)
    end
    
    def require_inspection
      result = []
      
      all.each do |patient|
        if patient && patient.appointments.any? && (Time.now > 6.months.since(patient.appointments.order("created_at DESC").last.created_at))
          result << patient
        end
      end
      
      return result
    end
  end
end