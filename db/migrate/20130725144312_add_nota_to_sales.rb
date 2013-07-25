class AddNotaToSales < ActiveRecord::Migration
  def change
    add_column :sales, :nota, :string
  end
end
