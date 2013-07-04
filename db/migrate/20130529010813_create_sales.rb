class CreateSales < ActiveRecord::Migration
  def self.up
    create_table :sales do |t|
      t.integer :cliente_id
      t.integer :seller_id
      t.integer :corte_id
      t.timestamps
    end
  end

  def self.down
    drop_table :sales
  end
end
