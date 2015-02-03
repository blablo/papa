class Inventario < ActiveRecord::Base
  attr_accessible :compra_id, :existencia, :minimo, :company_id
  belongs_to :compra
  belongs_to :company
end
