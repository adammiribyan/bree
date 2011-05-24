class AddFullNameToPatients < ActiveRecord::Migration
  def self.up
    add_column :patients, :full_name, :string
  end

  def self.down
    remove_column :patients, :full_name
  end
end
