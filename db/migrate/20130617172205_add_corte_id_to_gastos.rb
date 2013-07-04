class AddCorteIdToGastos < ActiveRecord::Migration
  def change
    add_column :gastos, :corte_id, :integer
  end
end
