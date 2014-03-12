class AddFacturaToGastos < ActiveRecord::Migration
  def change
    add_column :gastos, :factura, :boolean
    add_column :gastos, :subtotal, :float
    add_column :gastos, :iva, :float
  end
end
