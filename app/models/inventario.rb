class Inventario < ActiveRecord::Base
  attr_accessible :compra_id, :existencia, :minimo
  belongs_to :compra
end
