class RecetaLine < ActiveRecord::Base
  attr_accessible :compra_id, :product_id, :cantidad, :receta_id
  belongs_to :receta
  
end

