class RecetasController < ApplicationController
  def index

  end

  def new
    @receta = Receta.new
    @productos_no_receta = Product.no_receta

  end

  def create
    @receta = Receta.new(params[:receta])


    if @receta.save
      redirect_to @receta, :notice => "Successfully created receta."
    else
      render :action => 'new'
    end

  end

end
