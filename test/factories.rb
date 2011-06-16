# encoding: utf-8

def r_str
  ActiveSupport::SecureRandom.hex(3)
end

Factory.sequence :phone_number do |n|
  "+796082#{n}2350"
end

Factory.define :patient do |p|  
  p.first_name "Евгений"
  p.middle_name "Александрович"
  p.last_name "Онегин"
  p.title "Разгильдяй"
  p.birth_date 33.years.ago.to_s(:db)
  p.address "ул. Пушкина, д. 91, кв. 13"
  p.phone_number { Factory.next(:phone_number) }
  p.hepatitis "нет"
  p.tuberculosis "нет"
  p.occlusion "ортогнатический"
  p.allergy "нет"
  p.oncology "нет"
  p.mucosa "без видимых изменений"
  # p.full_name { |p| "#{p.last_name} #{p.first_name} #{p.middle_name}" }
  
  p.after_build do |patient|
    patient.teeth_chart = Factory.build(:teeth_chart, :patient_id => patient.id)
  end
  
  p.after_create do |patient|
    patient.teeth_chart.save
  end
end

Factory.define :service do |s|
  s.name "Лечение"
  s.price 299  
end

Factory.define :teeth_chart do |c|
  c.tooth_11 ""
  c.tooth_12 ""
  c.tooth_13 ""
  c.tooth_14 ""
  c.tooth_15 ""
  c.tooth_16 ""
  c.tooth_17 ""
  c.tooth_18 ""
  c.tooth_21 ""
  c.tooth_22 ""
  c.tooth_23 ""
  c.tooth_24 ""
  c.tooth_25 ""
  c.tooth_26 ""
  c.tooth_27 ""
  c.tooth_28 ""
  c.tooth_31 ""
  c.tooth_32 ""
  c.tooth_33 ""
  c.tooth_34 ""
  c.tooth_35 ""
  c.tooth_36 ""
  c.tooth_37 ""
  c.tooth_38 ""
  c.tooth_41 ""
  c.tooth_42 ""
  c.tooth_43 ""
  c.tooth_44 ""
  c.tooth_45 ""
  c.tooth_46 ""
  c.tooth_47 ""
  c.tooth_48 ""
  
  c.association :patient
end
