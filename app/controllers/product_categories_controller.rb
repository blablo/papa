class ProductCategoriesController < ApplicationController
load_and_authorize_resource
  def index
    @product_categories = current_company.product_categories.all
  end

  def show
    @product_category = current_company.product_categories.find(params[:id])
  end

  def new
    @product_category = current_company.product_categories.build
  end

  def create
    @product_category = current_company.product_categories.build(params[:product_category])
    if @product_category.save
      redirect_to @product_category, :notice => "Successfully created product category."
    else
      render :action => 'new'
    end
  end

  def edit
    @product_category = current_company.product_categories.find(params[:id])
  end

  def update
    @product_category = current_company.product_categories.find(params[:id])
    if @product_category.update_attributes(params[:product_category])
      redirect_to @product_category, :notice  => "Successfully updated product category."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @product_category = current_company.product_categories.find(params[:id])
    @product_category.destroy
    redirect_to product_categories_url, :notice => "Successfully destroyed product category."
  end
end
