class Product < ActiveRecord::Base
  attr_accessible :name, :price, :product_category_id, :avatar, :avatar_cache
  mount_uploader :avatar, AvatarUploader
  belongs_to :product_category
  has_one :receta


  def self.no_receta
    todo = []
    self.all.each do  |producto|
      todo << producto if producto.receta.blank?
    end
    return todo
  end

end
