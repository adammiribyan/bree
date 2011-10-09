module StatisticsHelper
  def selected_if_range_eq(range)
    range = range.to_s
    
    if params['range'].present? && params['range'] == range
      'class=selected'
    end
  end
  
  def services_price_sum(doctor = nil)
    sum = 0.0
    
    if doctor.present?    
      doctor.appointments.where(created_at: @range.interval).each do |appointment|
        appointment.line_items.each do |line_item|
          sum += line_item.service.price
        end
      end
    else
      Appointment.where(created_at: @range.interval).each do |appointment|
        appointment.line_items.each do |line_item|
          sum += line_item.service.price
        end
      end
    end
    
    return sum
  end
  
  def appointments_count(doctor = nil)
    if doctor.present?
      doctor.appointments.where(created_at: @range.interval).count
    else
      Appointment.where(created_at: @range.interval).count
    end
  end
  
  def new_patients_count(doctor = nil)
    if doctor.present?
      doctor.patients.where(created_at: @range.interval).count
    else
      Patient.where(created_at: @range.interval).count
    end
  end
  
  def primary_patients_count
    primary_patients = []
    
    Patient.where(created_at: @range.interval).each do |patient|
      primary_patients << patient if patient.appointments.count == 1
    end
    
    return primary_patients.count
  end
  
  def secondary_patients_count
    secondary_patients = []
    
    Patient.where(created_at: @range.interval).each do |patient|
      secondary_patients << patient if patient.appointments.count > 1
    end
    
    return secondary_patients.count
  end
end
