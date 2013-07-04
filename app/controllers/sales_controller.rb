class SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  def show
    @sale = Sale.find(params[:id])
  end

  def new
    @sale = Sale.new
    @product_categories = ProductCategory.roots
  end

  def create
    @sale = Sale.new(params[:sale])
    @sale.seller_id = current_user.id if current_user


    if @sale.save
      @sale.update_attribute(:total, @sale.sale_lines.sum(:valor))

      redirect_to new_sale_url, :notice => "Successfully created sale."
    else
      render :action => 'new'
    end
  end

  def edit
    @sale = Sale.find(params[:id])
    @product_categories = ProductCategory.roots

  end

  def update
    @sale = Sale.find(params[:id])
    @sale.seller_id = current_user.id if current_user


    if @sale.update_attributes(params[:sale])
      @sale.update_attribute(:total, @sale.sale_lines.sum(:valor))
      redirect_to @sale, :notice  => "Successfully updated sale."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy
    redirect_to sales_url, :notice => "Successfully destroyed sale."
  end
end