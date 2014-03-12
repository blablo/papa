class BalancesController < ApplicationController
  def index
    @cortes = Corte.order('fecha desc')

    @ffirst = @cortes.first.fecha.to_date
    @flast = @cortes.last.fecha.to_date

  end

  def show
    @cortes = Corte.where('YEAR(fecha) = ? and MONTH(fecha) = ?', params[:year], params[:month])
    @gastos = Gasto.where('YEAR(created_at) = ? and MONTH(created_at) = ?', params[:year], params[:month])
    if !@cortes.blank?
      @ffirst = @cortes.first.fecha.to_date
      @flast = @cortes.last.fecha.to_date
    end
    
  end
end
