class Proveedor < ActiveRecord::Base
  attr_accessible :nombre, :rfc, :company_id
  belongs_to :company
end
