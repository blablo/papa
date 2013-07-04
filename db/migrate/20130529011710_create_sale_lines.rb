class CreateSaleLines < ActiveRecord::Migration
  def change
    create_table :sale_lines do |t|
      t.integer :product_id
      t.integer :sale_id
      t.decimal :precio
      t.integer :cantidad
      t.decimal :descuento

      t.timestamps
    end
  end
end
