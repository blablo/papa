class ComprasController < ApplicationController
load_and_authorize_resource
  def index
    @compras = current_company.compras.all
    @comunes = current_company.compras.mas_comun(current_company.id)
  end

  def show
    @compra = current_company.compras.find(params[:id])
  end

end
