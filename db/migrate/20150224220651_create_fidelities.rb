class CreateFidelities < ActiveRecord::Migration
  def change
    create_table :fidelities do |t|
      t.integer :company_id
      t.integer :client_id
      t.float :points, precision: 10, scale: 2, default: 0
      t.timestamps
    end
  end
end
