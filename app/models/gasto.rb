class Gasto < ActiveRecord::Base
  attr_accessible :compra_id, :volumen, :precio, :fecha, :nota, :es_caja
  belongs_to :compra
  
  validates :compra_id, :presence => true
  validates :volumen, :presence => true
  validates :precio, :presence => true

  scope :no_corte, where(:corte_id => nil)

  scope :no_corte_caja, where(:corte_id => nil, :es_caja => true)

  scope :no_corte_no_caja, where(:corte_id => nil, :es_caja => false)
  
#  scope :mas_comun, order('count_id desc').group('compra_id').count('id')
  
  def name
    self.compra.name
  end

  def self.mas_comun
    self.order('count_id desc').group('compra_id').limit(6).count('id')
  end


end
