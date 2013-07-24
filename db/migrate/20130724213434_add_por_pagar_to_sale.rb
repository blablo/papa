class AddPorPagarToSale < ActiveRecord::Migration
  def change
    add_column :sales, :por_pagar, :boolean, :default => false
  end
end
