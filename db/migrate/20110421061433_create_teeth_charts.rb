class CreateTeethCharts < ActiveRecord::Migration
  def self.up
    create_table :teeth_charts do |t|
      t.string :tooth_11
      t.string :tooth_12
      t.string :tooth_13
      t.string :tooth_14
      t.string :tooth_15
      t.string :tooth_16
      t.string :tooth_17
      t.string :tooth_18      
      t.string :tooth_21
      t.string :tooth_22
      t.string :tooth_23
      t.string :tooth_24
      t.string :tooth_25
      t.string :tooth_26
      t.string :tooth_27
      t.string :tooth_28
      t.string :tooth_31
      t.string :tooth_32
      t.string :tooth_33
      t.string :tooth_34
      t.string :tooth_35
      t.string :tooth_36
      t.string :tooth_37
      t.string :tooth_38
      t.string :tooth_41
      t.string :tooth_42
      t.string :tooth_43
      t.string :tooth_44
      t.string :tooth_45
      t.string :tooth_46
      t.string :tooth_47
      t.string :tooth_48

      t.timestamps
    end
  end

  def self.down
    drop_table :teeth_charts
  end
end
