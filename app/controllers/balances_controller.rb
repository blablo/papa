class BalancesController < ApplicationController
  def index
    @cortes = current_company.cortes.order('fecha desc')

    @ffirst = @cortes.first.fecha.to_date
    @flast = @cortes.last.fecha.to_date

  end

  def show
    @cortes = current_company.cortes.where('YEAR(fecha) = ? and MONTH(fecha) = ?', params[:year], params[:month])
    @gastos = current_company.gastos.where('YEAR(created_at) = ? and MONTH(created_at) = ?', params[:year], params[:month])
    if !@cortes.blank?
      @ffirst = @cortes.first.fecha.to_date
      @flast = @cortes.last.fecha.to_date
    end
    
  end
end
