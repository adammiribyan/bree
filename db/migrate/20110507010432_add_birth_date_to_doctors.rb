class AddBirthDateToDoctors < ActiveRecord::Migration
  def self.up
    add_column :doctors, :birth_date, :date
  end

  def self.down
    remove_column :doctors, :birth_date
  end
end
