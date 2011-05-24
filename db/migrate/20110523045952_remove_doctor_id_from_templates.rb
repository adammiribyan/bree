class RemoveDoctorIdFromTemplates < ActiveRecord::Migration
  def self.up
    remove_column :templates, :doctor_id
  end

  def self.down
  end
end
