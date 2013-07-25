class Sale < ActiveRecord::Base
  attr_accessible :client_id, :seller_id, :corte_id, :total, :sale_lines_attributes, :por_pagar, :nota
  has_many :sale_lines, :dependent => :destroy
  belongs_to :client

  accepts_nested_attributes_for :sale_lines

  scope :no_corte, where(:corte_id => nil)

  
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

end
