class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :service_id
      t.integer :appointment_id

      t.timestamps
    end
  end
end
