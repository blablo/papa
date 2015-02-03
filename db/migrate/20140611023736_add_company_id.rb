class AddCompanyId < ActiveRecord::Migration
  def change
    add_column :clients, :company_id, :integer
    add_column :compras, :company_id, :integer
    add_column :compra_categories, :company_id, :integer
    add_column :cortes, :company_id, :integer
    add_column :gastos, :company_id, :integer
    add_column :inventarios, :company_id, :integer
    add_column :pedidos, :company_id, :integer
    add_column :products, :company_id, :integer
    add_column :product_categories, :company_id, :integer
    add_column :proveedores, :company_id, :integer
    add_column :recetas, :company_id, :integer
    add_column :receta_lines, :company_id, :integer
    add_column :sales, :company_id, :integer
    add_column :sale_lines, :company_id, :integer
  end
end
