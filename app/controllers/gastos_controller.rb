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
    if params[:compra_id]
      @gasto.compra_id = params[:compra_id]
    end

    respond_to do |format|
      format.js
    end

  end

  def create
    @gasto = Gasto.new(params[:gasto])

    respond_to do |format|

    if @gasto.save
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
