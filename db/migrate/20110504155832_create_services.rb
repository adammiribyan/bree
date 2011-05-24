class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.text :name
      t.float :price
      t.integer :category_id

      t.timestamps
    end
  end

  def self.down
    drop_table :services
  end
end
