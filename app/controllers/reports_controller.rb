class ReportsController < ApplicationController
  
  def index
    @cortes = Corte.order('created_at desc')
    @gastos = Gasto.no_corte_no_caja.order('created_at desc')
    @saldo = Corte.sum(:total_venta) - Gasto.sum(:precio)
  end

end
