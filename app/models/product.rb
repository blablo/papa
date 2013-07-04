class Product < ActiveRecord::Base
  attr_accessible :name, :price, :product_category_id, :avatar, :avatar_cache
  mount_uploader :avatar, AvatarUploader
  belongs_to :product_category
end
