class Waste < ActiveRecord::Base
  attr_accessible :corte_id, :product_id, :quantity
  belongs_to :product
  belongs_to :corte
  
  scope :no_corte, where(:corte_id => nil)
  
  validates :product_id, :presence => true
  after_create :actualiza_inventario

  def actualiza_inventario(tipo=:baja)
    if self.product.receta
      product.receta.receta_lines.each do |rl|
        inv = Inventario.where(:compra_id => rl.compra_id).first
        if tipo == :sube
          inv.update_attribute(:existencia, inv.existencia+(self.quantity*rl.cantidad)) if inv
        else
          inv.update_attribute(:existencia, inv.existencia-(self.quantity*rl.cantidad)) if inv
        end
      end
    end
  end
  
end
