class Compra < ActiveRecord::Base
  attr_accessible :name, :tipo, :medida, :avatar, :avatar_cache, :compra_category_id, :company_id
  mount_uploader :avatar, AvatarUploader
  has_many :gastos
  has_one :inventario
  belongs_to :compra_category
  belongs_to :company

  def self.mas_comun(company_id)
    comunes = []
    Gasto.mas_comun(company_id).each_pair do |c, v|
      comunes << c
    end
    return self.find(comunes)
  end

end

