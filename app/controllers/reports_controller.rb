class ReportsController < ApplicationController
  
  def index
    @cortes = Corte.order('created_at desc')
    @gastos = Gasto.no_corte_no_caja.order('created_at desc')
    @saldo = @cortes.sum(:total_venta) - @gastos.sum(:precio) - @cortes.sum(:total_gastos)
  end

end
