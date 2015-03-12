class CortesController < ApplicationController
load_and_authorize_resource
  # GET /cortes
  # GET /cortes.json
  def index
    @cortes = current_company.cortes.order('created_at desc').limit(8)
    @sales = current_company.sales.no_corte
    @cancellations = current_company.cancellations.no_corte
    @gastos = current_company.gastos.no_corte_caja
    @wastes = current_company.wastes.no_corte
    @corte_anterior = current_company.cortes.last rescue nil
    @corte = current_company.cortes.new
    @inventario = current_company.inventarios.all
    @recetas = { }

    @sales.each do |sale|
      sale.sale_lines.each do |line|
        if line.product and line.product.receta
          line.product.receta.receta_lines.each do |receta|
            if @recetas[receta.compra.name].blank?
              @recetas[receta.compra.name] = receta.cantidad * line.cantidad if receta.cantidad and line.cantidad
            else
              @recetas[receta.compra.name] += receta.cantidad * line.cantidad if receta.cantidad and line.cantidad
            end
          end
        end
      end
    end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cortes }
    end
  end

  # GET /cortes/1
  # GET /cortes/1.json
  def show
    @corte = current_company.cortes.find(params[:id])
    @sales = @corte.sales
    @gastos = @corte.gastos
    @cancellations = @corte.cancellations

    @recetas = { }

    @sales.each do |sale|
      sale.sale_lines.each do |line|
        if line.product and line.product.receta
          line.product.receta.receta_lines.each do |receta|
            if @recetas[receta.compra.name].blank?
              @recetas[receta.compra.name] = receta.cantidad * line.cantidad if receta.cantidad and line.cantidad
            else
              @recetas[receta.compra.name] += receta.cantidad * line.cantidad if receta.cantidad and line.cantidad
            end
          end
        end
      end
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @corte }
    end
  end

  # GET /cortes/new
  # GET /cortes/new.json
  def new
    @corte = current_company.cortes.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @corte }
    end
  end

  # GET /cortes/1/edit
  def edit
    @corte = current_company.cortes.find(params[:id])
  end

  # POST /cortes
  # POST /cortes.json
  def create
    @corte = current_company.cortes.new(params[:corte])
    @sales = current_company.sales.no_corte
    @gastos = current_company.gastos.no_corte_caja
    @cancellations = current_company.cancellations.no_corte


    @corte.total_venta = @sales.sum(:total)
    @corte.total_gastos = @gastos.sum(:precio)

    respond_to do |format|
      
      if @corte.save
        if @corte.fecha.blank?
          @corte.upadte_attribute(:fecha, @corte.created_at)
        end

        @sales.each do |sale|
          sale.update_attribute(:corte_id, @corte.id)
        end
        @gastos.each do |gasto|
          gasto.update_attribute(:corte_id, @corte.id)
        end
        @cancellations.each do |can|
          can.update_attribute(:corte_id, @corte.id)
        end
        @corte.update_attribute(:principales, @corte.count_recetas.to_json)
        
        format.html { redirect_to @corte, notice: 'current_company.cortes was successfully created.' }
        format.json { render json: @corte, status: :created, location: @corte }
      else
        format.html { render action: "new" }
        format.json { render json: @corte.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cortes/1
  # PUT /cortes/1.json
  def update
    @corte = current_company.cortes.find(params[:id])

    respond_to do |format|
      if @corte.update_attributes(params[:corte])
        format.html { redirect_to @corte, notice: 'current_company.cortes was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @corte.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cortes/1
  # DELETE /cortes/1.json
  def destroy
    @corte = current_company.cortes.find(params[:id])
    @corte.destroy

    respond_to do |format|
      format.html { redirect_to cortes_url }
      format.json { head :no_content }
    end
  end
end
