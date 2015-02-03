class ReportsController < ApplicationController
  load_and_authorize_resource

  def index
    @cortes = current_company.cortes.where('date(fecha) > date(?)', Date.today-2.months).order('fecha desc')

    @ffirst = @cortes.first.fecha.to_date
    @flast = @ffirst - 2.months

    @gastos = current_company.gastos.no_corte_no_caja.where('date(created_at) > date(?)', @flast).order('created_at desc')

    @saldo = @cortes.sum(:total_venta) - @gastos.sum(:precio) - @cortes.sum(:total_gastos)



  end

end
