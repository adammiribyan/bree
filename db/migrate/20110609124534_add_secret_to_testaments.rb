class AddSecretToTestaments < ActiveRecord::Migration
  def change
    add_column :testaments, :secret, :text
  end
end
