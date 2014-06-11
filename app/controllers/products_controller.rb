class ProductsController < ApplicationController
load_and_authorize_resource
  def index
    @products = current_company.products
  end

  def show
    @product = current_company.products.find(params[:id])
  end

  def new
    @product = current_company.products.build
  end

  def create
    @product = current_company.products.build(params[:product])
    if @product.save
      redirect_to @product, :notice => "Successfully created product."
    else
      render :action => 'new'
    end
  end

  def edit
    @product = current_company.products.find(params[:id])
  end

  def update
    @product = current_company.products.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to @product, :notice  => "Successfully updated product."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @product = current_company.products.find(params[:id])
    @product.destroy
    redirect_to products_url, :notice => "Successfully destroyed product."
  end
end
