class AddCompraCategoryIdToCompras < ActiveRecord::Migration
  def change
    add_column :compras, :compra_category_id, :integer
    remove_column :compras, :tipo
  end
end
