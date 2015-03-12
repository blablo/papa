class Inventario < ActiveRecord::Base
  attr_accessible :compra_id, :existencia, :minimo, :company_id
  belongs_to :compra
  belongs_to :company
  
  validates :compra_id, presence: true

end
