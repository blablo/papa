class RecetasController < ApplicationController
load_and_authorize_resource
  def index
    @recetas = Receta.all
  end

  def new
    @receta = Receta.new
    @productos_no_receta = Product.no_receta

  end

  def create
    @receta = Receta.new(params[:receta])


    if @receta.save
      redirect_to recetas_url
    else
      render :action => 'new'
    end

  end

  def edit
    @receta = Receta.find(params[:id])
    @productos_no_receta = Product.no_receta

  end


  def update
    @receta = Receta.find(params[:id])


    if @receta.update_attributes(params[:receta])
      redirect_to recetas_url, :notice => "Successfully created receta."
    else
      render :action => 'new'
    end

  end


  def destroy
    @receta = Receta.find(params[:id])

    @receta.destroy

    respond_to do |format|
      format.html { redirect_to recetas_url }
      format.json { head :no_content }
    end

  end

end
