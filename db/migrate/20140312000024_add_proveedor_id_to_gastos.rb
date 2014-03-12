class AddProveedorIdToGastos < ActiveRecord::Migration
  def change
    add_column :gastos, :proveedor_id, :integer
  end
end
