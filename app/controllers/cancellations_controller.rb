class CancellationsController < ApplicationController
  load_and_authorize_resource

  def new
    @cancellation = current_company.cancellations.build(sale_id: params[:sale_id])
    @sale = @cancellation.sale
    respond_to do |format|
      format.js
    end
  end

  def create
    @cancellation = current_company.cancellations.build(params[:cancellation])
    @sale = @cancellation.sale
    
    respond_to do |format|
      if @cancellation.save
        @sale.actualiza_inventario(:sube)
        if current_company.points_system and @sale.client
          fidelity = Fidelity.find_or_create_by_client_id(@sale.client_id)
          
          fidelity.update_attribute(:points, fidelity.points - current_company.points_rate * @sale.total) if fidelity.points > current_company.points_rate * @sale.total

        end
        @sale.destroy
        format.js
      else
        format.js
      end
    end
  end


end
