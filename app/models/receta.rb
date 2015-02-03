class Receta < ActiveRecord::Base
  attr_accessible :name, :product_id, :receta_lines_attributes, :company_id
  has_many :receta_lines
  belongs_to :product
  accepts_nested_attributes_for :receta_lines
  belongs_to :company

end
