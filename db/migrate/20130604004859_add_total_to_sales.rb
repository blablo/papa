class AddTotalToSales < ActiveRecord::Migration
  def change
    add_column :sales, :total, :decimal
  end
end
