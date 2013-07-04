class SaleLine < ActiveRecord::Base
  attr_accessible :cantidad, :descuento, :precio, :product_id, :sale_id, :valor
  belongs_to :product
end
