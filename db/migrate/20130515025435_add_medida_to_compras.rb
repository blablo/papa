class AddMedidaToCompras < ActiveRecord::Migration
  def change
    add_column :compras, :medida, :string
  end
end
