class Sale < ActiveRecord::Base
  attr_accessible :client_id, :seller_id, :corte_id, :total, :sale_lines_attributes, :por_pagar, :nota, :domicilio
  has_many :sale_lines, :dependent => :destroy
  has_many :pedidos, :dependent => :destroy

  belongs_to :client

  accepts_nested_attributes_for :sale_lines

  scope :no_corte, where(:corte_id => nil)

  validate :absolute_total, :on => :create

  def absolute_total

    if self.sale_lines.inject(0){|v, sl| v + sl.valor } <= 0
      errors.add(:total, "no puede ser negativo o zero. Para registrar compras dale click en NUEVA COMPRA.")
    end
  end

  def sale_names
    nombres = []
    self.sale_lines.each do |line|
      if line.product.nil?
        nombres << line.valor.to_s
      else
        if line.cantidad > 1
          nombres << line.cantidad.to_s + "(" + line.product.name + ")"
        else
          nombres << line.product.name
        end
      end
    end
    return nombres.to_sentence
  end

  def actualiza_inventario(tipo)
    self.sale_lines.each do |sl|
      if sl.product and sl.product.receta

        sl.product.receta.receta_lines.each do |rl|
          inv = Inventario.where(:compra_id => rl.compra_id).first
          if tipo == :sube
            inv.update_attribute(:existencia, inv.existencia+(sl.cantidad*rl.cantidad)) if inv
          else
            inv.update_attribute(:existencia, inv.existencia-(sl.cantidad*rl.cantidad)) if inv
          end

        end
      end
    end
  end

  def carnes
    tmp = []
    self.sale_lines.each do |sl| 
        tmp << sl if !sl.nil? and Product.carnes.include?(sl.product_id) 
    end
    return tmp
  end


end
