class CreateCancellations < ActiveRecord::Migration
  def change
    create_table :cancellations do |t|
      t.integer :sale_id
      t.text :desc
      t.decimal :total
      t.text :reason
      t.integer :company_id
      t.integer :corte_id

      t.timestamps
    end
  end
end
