class AddHistoryToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :history, :text
  end
end
