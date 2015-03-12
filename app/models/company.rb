class Company < ActiveRecord::Base
  attr_accessible :logo, :name, :rfc, :address, :webpage, :phone, :ticket_copies, :points_system, :points_rate

  has_many :clients
  has_many :compras
  has_many :compra_categories
  has_many :cortes
  has_many :gastos
  has_many :inventarios
  has_many :pedidos
  has_many :products
  has_many :product_categories
  has_many :proveedores
  has_many :recetas
  has_many :receta_lines
  has_many :sales
  has_many :sale_lines
  has_many :users
  has_many :cancellations
  has_many :wastes

  mount_uploader :logo, AvatarUploader

end
