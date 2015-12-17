class Company < ActiveRecord::Base
  attr_accessible :logo, :name, :rfc, :address, :webpage, :phone, :ticket_copies, :points_system, :points_rate, :user_id

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

  after_save :link_user
  
  mount_uploader :logo, AvatarUploader

  attr_accessor :user_id

  def link_user
    if self.user_id
      user = User.find(self.user_id)
      user.company_id = self.id
      user.roles << Role.find_by_name("admin")
      user.save
    end
  end
  
end
