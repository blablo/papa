class Proveedor < ActiveRecord::Base
  attr_accessible :nombre, :rfc
  belongs_to :company
end
