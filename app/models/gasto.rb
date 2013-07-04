class Gasto < ActiveRecord::Base
  attr_accessible :compra_id, :volumen, :precio, :fecha, :nota
  belongs_to :compra
  
  validates :compra_id, :presence => true
  validates :volumen, :presence => true
  validates :precio, :presence => true

  scope :no_corte, where(:corte_id => nil)
  
  def name
    self.compra.name
  end


end
