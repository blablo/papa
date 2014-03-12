class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.string :orden
      t.integer :sale_id
      t.integer :client_id
      t.float :cambio

      t.timestamps
    end
  end
end
