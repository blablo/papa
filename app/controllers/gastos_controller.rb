class GastosController < ApplicationController
load_and_authorize_resource
  def index
    if params[:compra_id]
      @gastos = current_company.gastos.where(:compra_id => params[:compra_id]).order('created_at desc')
    else
      @gastos = current_company.gastos.order('created_at desc')
    end
  end

  def show
    @gasto = current_company.gastos.find(params[:id])

  end

  def new
    @gasto = current_company.gastos.build
    @proveedores = current_company.proveedores

    if params[:compra_id]
      @gasto.compra_id = params[:compra_id]
    end
    @ultimo_gasto = current_company.gastos.where(:compra_id => params[:compra_id]).last

    respond_to do |format|
      format.js
    end
  end

  def create
    @gasto = current_company.gastos.build(params[:gasto])
    respond_to do |format|

    if @gasto.save
      @gasto.update_attribute(:factura, true) if @gasto.iva and @gasto.iva > 0

      if @gasto.compra.inventario
        inventario = @gasto.compra.inventario
        inventario.update_attribute(:existencia, inventario.existencia + @gasto.volumen)
      end
      format.js 
    else
      render :action => 'new'
    end
    end
  end

  def edit
    @gasto = current_company.gastos.find(params[:id])
  end

  def update
    @gasto = current_company.gastos.find(params[:id])
    if @gasto.update_attributes(params[:gasto])

      redirect_to @gasto, :notice  => "Successfully updated gasto."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @gasto = current_company.gastos.find(params[:id])
    @gasto.destroy
    redirect_to :back, :notice => "Se ha cancelado el gasto."
  end
end
