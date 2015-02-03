class PedidosController < ApplicationController
  def destroy
    @pedido = current_company.pedidos.find(params[:id])
    @pedido.destroy
    redirect_to :back, :notice => "Pedido entregado. :)"

  end
end
