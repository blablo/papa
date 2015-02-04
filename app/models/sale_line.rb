class SaleLine < ActiveRecord::Base
  attr_accessible :cantidad, :descuento, :precio, :product_id, :sale_id, :valor, :company_id
  belongs_to :product
  belongs_to :company

  before_validation do
    self.company_id ||= self.product.company_id
  end
end
