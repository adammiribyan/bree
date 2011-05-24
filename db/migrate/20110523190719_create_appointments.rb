class CreateAppointments < ActiveRecord::Migration
  def self.up
    create_table :appointments do |t|
      t.references :patient
      t.references :doctor

      t.timestamps
    end
  end

  def self.down
    drop_table :appointments
  end
end
