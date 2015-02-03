class RecetasController < ApplicationController
load_and_authorize_resource
  def index
    @recetas = current_company.recetas.all
  end

  def new
    @receta = current_company.recetas.new
    @productos_no_receta = current_company.products.no_receta 

  end

  def create
    @receta = current_company.recetas.new(params[:receta])


    if @receta.save
      redirect_to recetas_url
    else
      render :action => 'new'
    end

  end

  def edit
    @receta = current_company.recetas.find(params[:id])
    @productos_no_receta = current_company.products.no_receta + [@receta.product]

  end


  def update
    @receta = current_company.recetas.find(params[:id])


    if @receta.update_attributes(params[:receta])
      redirect_to recetas_url, :notice => "Successfully created receta."
    else
      render :action => 'new'
    end

  end


  def destroy
    @receta = current_company.recetas.find(params[:id])

    @receta.destroy

    respond_to do |format|
      format.html { redirect_to recetas_url }
      format.json { head :no_content }
    end

  end

end
