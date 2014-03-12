class AddDomicilioToSale < ActiveRecord::Migration
  def change
    add_column :sales, :domicilio, :boolean
  end
end
