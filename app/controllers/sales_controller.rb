# -*- coding: utf-8 -*-
class SalesController < ApplicationController
load_and_authorize_resource
  def index
    @sales = current_company.sales.order('created_at desc')
    @sales_pagar = current_company.sales.where(:por_pagar => true)

  end

  def show
    @sale = current_company.sales.find(params[:id])
  end

  def new
    @sale = current_company.sales.new
    @current_company = current_company
    if current_company.sales.no_corte.last.nil?
      @sale_num = '1'
    else
      @sale_num = (current_company.sales.no_corte.last.orden.to_i + 1).to_s
    end

    @product_categories = current_company.product_categories.roots

    @inventarios = current_company.inventarios.where('existencia <= minimo')
    @pedidos = current_company.pedidos.all
  end

  def create

    @sale = current_company.sales.new(params[:sale])
    @sale.seller_id = current_user.id if current_user
      @orden = '1'
      if current_company.sales.no_corte.count > 0
        @orden = (current_company.sales.no_corte.last.orden.to_i + 1).to_s
      end

    @sale.sale_lines.each{|sl| sl.company_id = @sale.company_id}

    if @sale.save

      @sale.update_attribute(:orden, @orden)

      Pedido.create(:orden => @orden, :sale_id => @sale.id, :client_id => @sale.client_id, :company_id => current_company.id) if @sale.domicilio
      
      
      @sale.update_attribute(:total, @sale.sale_lines.sum(:valor))

      if @sale.client and current_company.points_system
        fidelity = Fidelity.find_or_create_by_client_id(@sale.client_id)
        fidelity.update_attribute(:points, fidelity.points + current_company.points_rate * @sale.total)
      end


      @sale.actualiza_inventario(:baja)
      respond_to :js
      #respond_to :html, redirect_to(new_sale_url, :notice => "¡Venta Registrada! ¡Tu muy bien! :)")

    else
      @pedidos = current_company.pedidos.all
      render js: "alert('" + @sale.errors.full_messages[0] + "');"
#      render :action => 'new'
    end
  end

  def edit
    @sale = current_company.sales.find(params[:id])
    @product_categories = current_company.product_categories.roots


  end

  def update
    @sale = current_company.sales.find(params[:id])
    @sale.seller_id = current_user.id if current_user


    if @sale.update_attributes(params[:sale])
      @sale.update_attribute(:total, @sale.sale_lines.sum(:valor))
      redirect_to @sale, :notice  => "Successfully updated sale."
    else
      render :action => 'edit'
    end
  end
  
  def pagar
    @sale = current_company.sales.find(params[:id])
    @sale.update_attribute(:por_pagar, false)
    redirect_to sales_url
  end

  def destroy
    @sale = current_company.sales.find(params[:id])
    @sale.actualiza_inventario(:sube)
    @sale.destroy
    redirect_to :back, :notice => "Se ha cancelado la venta."
  end
end
