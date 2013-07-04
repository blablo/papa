class AddTotalGastosTotalVentaToCortes < ActiveRecord::Migration
  def change
    add_column :cortes, :total_gastos, :decimal
    add_column :cortes, :total_venta, :decimal
    add_column :cortes, :caja, :decimal
  end
end
