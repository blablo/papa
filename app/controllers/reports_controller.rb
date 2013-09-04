class ReportsController < ApplicationController
load_and_authorize_resource

  def index
    @cortes = Corte.order('fecha desc')
    @gastos = Gasto.no_corte_no_caja.order('created_at desc')
    @saldo = @cortes.sum(:total_venta) - @gastos.sum(:precio) - @cortes.sum(:total_gastos)
    
    @ffirst = @cortes.first.fecha.to_date
    @flast = @cortes.last.fecha.to_date
    
    @ventas_totales = @cortes.map{|c| c.total_venta}
    @gastos_totales = @cortes.map{|c| c.total_gastos}
    @fechas = @cortes.map{|c| "'" + c.fecha.strftime("%d/%m/%Y") + "'"}
    

  end

end
