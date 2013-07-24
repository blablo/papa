class RenameClienteIdToSales < ActiveRecord::Migration
  def self.up
    rename_column :sales, :cliente_id, :client_id
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end
