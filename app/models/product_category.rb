class ProductCategory < ActiveRecord::Base
  attr_accessible :name, :parent_id, :avatar, :avatar_cache
  mount_uploader :avatar, AvatarUploader
  belongs_to :parent, :class_name => "ProductCategory", :foreign_key => "parent_id"
  has_many :products
  has_ancestry



end
