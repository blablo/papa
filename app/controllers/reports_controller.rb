class ReportsController < ApplicationController
  load_and_authorize_resource

  def index
    @cortes = Corte.order('fecha desc')
    @gastos = Gasto.no_corte_no_caja.order('created_at desc')
    @saldo = @cortes.sum(:total_venta) - @gastos.sum(:precio) - @cortes.sum(:total_gastos)

    @ffirst = @cortes.first.fecha.to_date
    @flast = @cortes.last.fecha.to_date

    @ventas_totales = []
    @gastos_totales = []
    @fechas = []
    @pollos = []

    @flast.upto(@ffirst).each  do |date|
      @fechas << date
      cortes = @cortes.where('date(fecha) = ?', date)
      if cortes.blank?
        @ventas_totales << 0
        @gastos_totales << 0
        @pollos << 0
      else
        ventas_totales = 0
        gastos_totales = 0
        pollos = 0
        cortes.each do |corte|
          ventas_totales += corte.total_venta
          gastos_totales += corte.total_gastos
          
          if corte.count_recetas["Pollo"]
            pollos += corte.count_recetas["Pollo"]
          end
        end
        @ventas_totales << ventas_totales
        @gastos_totales << gastos_totales        
        @pollos << pollos
      end
    end

  end

end
