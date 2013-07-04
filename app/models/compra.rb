class Compra < ActiveRecord::Base
  attr_accessible :name, :tipo, :medida, :avatar, :avatar_cache, :compra_category_id
  mount_uploader :avatar, AvatarUploader
  has_many :gastos
  belongs_to :compra_category

end
