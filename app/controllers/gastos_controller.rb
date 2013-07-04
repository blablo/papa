class GastosController < ApplicationController
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


    if @gasto.save
      redirect_to @gasto, :notice => "Successfully created gasto."
    else
      render :action => 'new'
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
    redirect_to gastos_url, :notice => "Successfully destroyed gasto."
  end
end
