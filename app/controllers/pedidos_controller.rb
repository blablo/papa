class PedidosController < ApplicationController
  def destroy
    @pedido = Pedido.find(params[:id])
    @pedido.destroy
    redirect_to :back, :notice => "Pedido entregado. :)"

  end
end
