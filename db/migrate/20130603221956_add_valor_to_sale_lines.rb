class AddValorToSaleLines < ActiveRecord::Migration
  def change
    add_column :sale_lines, :valor, :decimal
  end
end
