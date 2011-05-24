class CreatePatients < ActiveRecord::Migration
  def self.up
    create_table :patients do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :title
      t.date :birth_date
      t.string :address
      t.string :phone_number
      t.string :hepatitis
      t.string :tuberculosis
      t.string :occlusion
      t.string :allergy
      t.string :oncology
      t.string :mucosa

      t.timestamps
    end
  end

  def self.down
    drop_table :patients
  end
end
