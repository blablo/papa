class AddOrdenToSales < ActiveRecord::Migration
  def change
    add_column :sales, :orden, :string
  end
end
