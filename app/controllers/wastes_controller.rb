class WastesController < ApplicationController
  def index
    @wastes = current_company.wastes
  end

  def show
    @waste = current_company.wastes.find(params[:id])
  end

  def new
    @waste = current_company.wastes.build
    @products = current_company.products
    
    @wastes = current_company.wastes.no_corte

  end

  def create
    @waste = current_company.wastes.build(params[:waste])
    if @waste.save
      redirect_to new_waste_url, :notice => "Successfully created waste."
    else
      render :action => 'new'
    end
  end

  def edit
    @waste = current_company.wastes.find(params[:id])
  end

  def update
    @waste = current_company.wastes.find(params[:id])
    if @waste.update_attributes(params[:waste])
      redirect_to @waste, :notice  => "Successfully updated waste."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @waste = current_company.wastes.find(params[:id])
    @waste.destroy
    redirect_to wastes_url, :notice => "Successfully destroyed waste."
  end

end
