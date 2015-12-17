class CompraCategory < ActiveRecord::Base
  attr_accessible :name, :company_id
  belongs_to :company
  has_many :compras
end
