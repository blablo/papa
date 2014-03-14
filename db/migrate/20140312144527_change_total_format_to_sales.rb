class ChangeTotalFormatToSales < ActiveRecord::Migration
  def up
    change_column :sales, :total, :float
    change_column :sale_lines, :valor, :float
  end

  def down
    change_column :sales, :total, :integer
    change_column :sale_lines, :valor, :integer
  end
end
