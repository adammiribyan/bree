class RemoveDoctorIdAndAddHasTeethChartToTemplates < ActiveRecord::Migration
  def self.up
    add_column :templates, :has_teeth_chart, :boolean
  end

  def self.down
  end
end
