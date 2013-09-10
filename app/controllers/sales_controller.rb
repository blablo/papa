# -*- coding: utf-8 -*-
class SalesController < ApplicationController
load_and_authorize_resource
  def index
    @sales = Sale.order('created_at desc')
    
    @sales_pagar = Sale.where(:por_pagar => true)

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

      redirect_to new_sale_url, :notice => "¡Venta Registrada! ¡Tu muy bien! :)"
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
  
  def pagar
    @sale = Sale.find(params[:id])
    @sale.update_attribute(:por_pagar, false)
    redirect_to sales_url
  end

  def destroy
    @sale = Sale.find(params[:id])
    @sale.destroy
    redirect_to sales_url, :notice => "Successfully destroyed sale."
  end
end
