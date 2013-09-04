class ComprasController < ApplicationController
load_and_authorize_resource
  def index
    @compras = Compra.all
    @comunes = Compra.mas_comun
  end

  def show
    @compra = Compra.find(params[:id])
  end

  def new
    @compra = Compra.new
  end

  def create
    @compra = Compra.new(params[:compra])
    if @compra.save
      redirect_to @compra, :notice => "Successfully created compra."
    else
      render :action => 'new'
    end
  end

  def edit
    @compra = Compra.find(params[:id])
  end

  def update
    @compra = Compra.find(params[:id])
    if @compra.update_attributes(params[:compra])
      redirect_to @compra, :notice  => "Successfully updated compra."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @compra = Compra.find(params[:id])
    @compra.destroy
    redirect_to compras_url, :notice => "Successfully destroyed compra."
  end
end
