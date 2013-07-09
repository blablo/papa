class CreateReceta < ActiveRecord::Migration
  def change
    create_table :recetas do |t|
      t.string :name
      t.integer :product_id

      t.timestamps
    end

    create_table :receta_lines do |t|
      t.integer :compra_id
      t.integer :product_id
      t.integer :receta_id
      t.decimal :cantidad

      t.timestamps
    end
  end
end
