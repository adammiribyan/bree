class AddPatientIdToTeethCharts < ActiveRecord::Migration
  def self.up
    add_column :teeth_charts, :patient_id, :integer
  end

  def self.down
    remove_column :teeth_charts, :patient_id
  end
end
