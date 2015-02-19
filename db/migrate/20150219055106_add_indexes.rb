class AddIndexes < ActiveRecord::Migration
  def change
    add_index(:clients, :company_id) unless index_exists?(:clients, :company_id)

    add_index(:compras, :company_id) unless index_exists?(:compras, :company_id)
    add_index(:compras, :compra_category_id) unless index_exists?(:compras, :compra_category_id)

    add_index(:compra_categories, :company_id) unless index_exists?(:compra_categories, :company_id)

    add_index(:cortes, :company_id) unless index_exists?(:cortes, :company_id)

    add_index(:gastos, :company_id) unless index_exists?(:gastos, :company_id)
    add_index(:gastos, :compra_id) unless index_exists?(:gastos, :compra_id)
    add_index(:gastos, :proveedor_id) unless index_exists?(:gastos, :proveedor_id)

    add_index(:inventarios, :company_id) unless index_exists?(:inventarios, :company_id)
    add_index(:inventarios, :compra_id) unless index_exists?(:inventarios, :compra_id)

    add_index(:pedidos, :company_id) unless index_exists?(:pedidos, :company_id)
    add_index(:pedidos, :client_id) unless index_exists?(:pedidos, :client_id)
    add_index(:pedidos, :sale_id) unless index_exists?(:pedidos, :sale_id)

    add_index(:products, :company_id) unless index_exists?(:products, :company_id)

    add_index(:product_categories, :company_id) unless index_exists?(:product_categories, :company_id)

    add_index(:proveedores, :company_id) unless index_exists?(:proveedores, :company_id)

    add_index(:recetas, :company_id) unless index_exists?(:recetas, :company_id)

    add_index(:receta_lines, :company_id) unless index_exists?(:receta_lines, :company_id)
    add_index(:receta_lines, :compra_id) unless index_exists?(:receta_lines, :compra_id)
    add_index(:receta_lines, :product_id) unless index_exists?(:receta_lines, :product_id)
    add_index(:receta_lines, :receta_id) unless index_exists?(:receta_lines, :receta_id)


    add_index(:sales, :company_id) unless index_exists?(:sales, :company_id)
    add_index(:sales, :client_id) unless index_exists?(:sales, :client_id)

    add_index(:sale_lines, :company_id) unless index_exists?(:sale_lines, :company_id)
    add_index(:sale_lines, :product_id) unless index_exists?(:sale_lines, :product_id)

    add_index(:users, :company_id) unless index_exists?(:users, :company_id)

  end
end
