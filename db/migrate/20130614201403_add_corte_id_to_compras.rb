class AddCorteIdToCompras < ActiveRecord::Migration
  def change
    add_column :compras, :corte_id, :integer
  end
end
