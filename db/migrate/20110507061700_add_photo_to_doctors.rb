class AddPhotoToDoctors < ActiveRecord::Migration
  def self.up
    add_column :doctors, :photo, :string
  end

  def self.down
    remove_column :doctors, :photo
  end
end
