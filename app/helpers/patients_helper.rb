# encoding: utf-8

module PatientsHelper
  def link_to_other_patient_appointments(patient)
    appointments_left_count = patient.appointments.count - 10
    
    if patient && appointments_left_count > 0
      noun = Russian.p(appointments_left_count, "посещение", "посещения", "посещений")
      
      return link_to "Остальные #{appointments_left_count} #{noun}", patient_appointments_path(patient)
    else
      nil
    end
  end
end
