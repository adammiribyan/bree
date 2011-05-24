class RemoveHasTeethChartFromTemplates < ActiveRecord::Migration
  def self.up
    remove_column :templates, :has_teeth_chart
  end

  def self.down
  end
end
