class AddProfileToPatients < ActiveRecord::Migration
  def self.up
    add_column :patients, :profile, :string
  end

  def self.down
    remove_column :patients, :profile
  end
end
