class RecetaLine < ActiveRecord::Base
  attr_accessible :compra_id, :product_id, :cantidad, :receta_id, :company_id
  belongs_to :receta
  belongs_to :product
  belongs_to :compra
  belongs_to :company

  validates :cantidad, numericality: true, presence: true
  validates :compra_id, presence: true
  
end

