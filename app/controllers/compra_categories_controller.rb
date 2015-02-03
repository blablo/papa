class CompraCategoriesController < ApplicationController
load_and_authorize_resource
  def index
    @compra_categories = current_company.compra_categories.all
  end

  def show
    @compra_category = current_company.compra_categories.find(params[:id])
  end

  def new
    @compra_category = current_company.compra_categories.build
  end

  def create
    @compra_category = current_company.compra_categories.build(params[:compra_category])
    if @compra_category.save
      redirect_to @compra_category, :notice => "Successfully created compra category."
    else
      render :action => 'new'
    end
  end

  def edit
    @compra_category = current_company.compra_categories.find(params[:id])
  end

  def update
    @compra_category = current_company.compra_categories.find(params[:id])
    if @compra_category.update_attributes(params[:compra_category])
      redirect_to @compra_category, :notice  => "Successfully updated compra category."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @compra_category = current_company.compra_categories.find(params[:id])
    @compra_category.destroy
    redirect_to compra_categories_url, :notice => "Successfully destroyed compra category."
  end
end
