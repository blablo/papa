class ComprasController < ApplicationController
load_and_authorize_resource
  def index
    @compras = current_company.compras.all
    @comunes = current_company.compras.mas_comun(current_company.id)
  end

  def show
    @compra = current_company.compras.find(params[:id])
  end

  def new
    @compra = current_company.compras.new
  end

  def create
    @compra = current_company.compras.new(params[:compra])
    if @compra.save
      redirect_to @compra, :notice => "Successfully created compra."
    else
      render :action => 'new'
    end
  end

  def edit
    @compra = current_company.compras.find(params[:id])
  end

  def update
    @compra = current_company.compras.find(params[:id])
    if @compra.update_attributes(params[:compra])
      redirect_to @compra, :notice  => "Successfully updated compra."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @compra = current_company.compras.find(params[:id])
    @compra.destroy
    redirect_to compras_url, :notice => "Successfully destroyed compra."
  end
end
