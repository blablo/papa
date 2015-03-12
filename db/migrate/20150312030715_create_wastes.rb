class CreateWastes < ActiveRecord::Migration
  def change
    create_table :wastes do |t|
      t.integer :product_id
      t.float :quantity
      t.integer :corte_id
      t.integer :company_id

      t.timestamps
    end
  end
end
