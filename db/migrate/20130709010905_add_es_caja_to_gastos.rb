class AddEsCajaToGastos < ActiveRecord::Migration
  def change
    add_column :gastos, :es_caja, :boolean, default: true
  end
end
