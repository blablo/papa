class Corte < ActiveRecord::Base
  attr_accessible :user_id, :caja, :fecha
  has_many :sales
  has_many :gastos



  def count_recetas
    @recetas = { }

    self.sales.each do |sale|
      sale.sale_lines.each do |line|
        if line.product and line.product.receta
          line.product.receta.receta_lines.each do |receta|

            if @recetas[receta.compra.name].blank?
              @recetas[receta.compra.name] = receta.cantidad * line.cantidad if line.cantidad and receta.cantidad
            else
              @recetas[receta.compra.name] += receta.cantidad * line.cantidad if line.cantidad and receta.cantidad
            end
          end
        end
      end
    end
    return @recetas
  end

end
