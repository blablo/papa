class AddNotaToGasto < ActiveRecord::Migration
  def change
    add_column :gastos, :nota, :string
  end
end
