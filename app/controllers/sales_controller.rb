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

    if Sale.no_corte.last.nil?
      @sale_num = '1'
    else
      @sale_num = (Sale.no_corte.last.orden.to_i + 1).to_s
    end

    @product_categories = ProductCategory.roots

    @inventarios = Inventario.where('existencia <= minimo')
    @pedidos = Pedido.all
  end

  def create
    @sale = Sale.new(params[:sale])
    @sale.seller_id = current_user.id if current_user
      @orden = '1'
      if Sale.no_corte.count > 0
        @orden = (Sale.no_corte.last.orden.to_i + 1).to_s
      end
 
    if @sale.save


     

      @sale.update_attribute(:orden, @orden)

      Pedido.create(:orden => @orden, :sale_id => @sale.id, :client_id => @sale.client_id) if @sale.domicilio

      @sale.update_attribute(:total, @sale.sale_lines.sum(:valor))
      @sale.actualiza_inventario(:baja)
      respond_to :js
      #respond_to :html, redirect_to(new_sale_url, :notice => "¡Venta Registrada! ¡Tu muy bien! :)")

    else
      render js: "alert('ma');"
#      render :action => 'new'
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
    @sale.actualiza_inventario(:sube)
    @sale.destroy
    redirect_to :back, :notice => "Se ha cancelado la venta."
  end
end
