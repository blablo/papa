class GastosController < ApplicationController
load_and_authorize_resource
  def index
    @gastos = Gasto.all
  end

  def show
    @gasto = Gasto.find(params[:id])
  end

  def new
    @gasto = Gasto.new
    @proveedores = Proveedor.all

    if params[:compra_id]
      @gasto.compra_id = params[:compra_id]
    end
    @ultimo_gasto = Gasto.where(:compra_id => params[:compra_id]).last

    respond_to do |format|
      format.js
    end

  end

  def create
    @gasto = Gasto.new(params[:gasto])
    respond_to do |format|

    if @gasto.save
      @gasto.update_attribute(:factura, true) if @gasto.iva and @gasto.iva > 0

      if @gasto.compra.inventario
        inventario = @gasto.compra.inventario
        inventario.update_attribute(:existencia, inventario.existencia + @gasto.volumen)
      end
      format.js { render :js => "$('#new_gasto').modal('hide');"}
    else
      render :action => 'new'
    end
    end
  end

  def edit
    @gasto = Gasto.find(params[:id])
  end

  def update
    @gasto = Gasto.find(params[:id])
    if @gasto.update_attributes(params[:gasto])

      redirect_to @gasto, :notice  => "Successfully updated gasto."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @gasto = Gasto.find(params[:id])
    @gasto.destroy
    redirect_to :back, :notice => "Se ha cancelado el gasto."
  end
end
