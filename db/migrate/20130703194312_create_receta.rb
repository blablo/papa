class CreateReceta < ActiveRecord::Migration
  def change
    create_table :receta do |t|
      t.integer :compra_id
      t.integer :product_id
      t.decimal :cantidad

      t.timestamps
    end
  end
end
