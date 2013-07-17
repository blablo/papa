class ChangeIntegerToFloat < ActiveRecord::Migration
  def up
   change_column :gastos, :precio, :float
   change_column :cortes, :total_gastos, :float
   change_column :cortes, :total_venta, :float
   change_column :products, :price, :float

  end

  def down
   change_column :gastos, :precio, :integer
   change_column :cortes, :total_gastos, :integer
   change_column :cortes, :total_venta, :integer
   change_column :products, :price, :integer
  end
end
