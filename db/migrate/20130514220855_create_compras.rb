class CreateCompras < ActiveRecord::Migration
  def self.up
    create_table :compras do |t|
      t.string :name
      t.string :tipo
      t.timestamps
    end
  end

  def self.down
    drop_table :compras
  end
end
