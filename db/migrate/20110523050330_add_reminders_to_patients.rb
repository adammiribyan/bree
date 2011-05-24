class AddRemindersToPatients < ActiveRecord::Migration
  def self.up
    add_column :patients, :remind_for_birthday, :boolean
    add_column :patients, :remind_for_inspection, :boolean
  end

  def self.down
    remove_column :patients, :remind_for_inspection
    remove_column :patients, :remind_for_birthday
  end
end
