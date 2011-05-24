class CreateDoctors < ActiveRecord::Migration
  def self.up
    create_table :doctors do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :title
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end

  def self.down
    drop_table :doctors
  end
end
