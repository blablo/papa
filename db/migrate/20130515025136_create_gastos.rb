class CreateGastos < ActiveRecord::Migration
  def self.up
    create_table :gastos do |t|
      t.integer :compra_id
      t.float :volumen
      t.decimal :precio
      t.datetime :fecha
      t.timestamps
    end
  end

  def self.down
    drop_table :gastos
  end
end
