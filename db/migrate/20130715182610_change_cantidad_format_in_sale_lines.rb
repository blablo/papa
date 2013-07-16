class ChangeCantidadFormatInSaleLines < ActiveRecord::Migration
 def up
   change_column :sale_lines, :precio, :float
   change_column :sale_lines, :cantidad, :float
   change_column :sale_lines, :descuento, :float
  end

  def down
   change_column :sale_lines, :cantidad, :integer
   change_column :sale_lines, :precio, :integer
   change_column :sale_lines, :descuento, :integer
  end

end
