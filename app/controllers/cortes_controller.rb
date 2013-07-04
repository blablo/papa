class CortesController < ApplicationController
  # GET /cortes
  # GET /cortes.json
  def index
    @cortes = Corte.all
    @sales = Sale.no_corte
    @gastos = Gasto.no_corte
    @corte = Corte.new
    @corte_anterior = Corte.last rescue nil

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cortes }
    end
  end

  # GET /cortes/1
  # GET /cortes/1.json
  def show
    @corte = Corte.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @corte }
    end
  end

  # GET /cortes/new
  # GET /cortes/new.json
  def new
    @corte = Corte.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @corte }
    end
  end

  # GET /cortes/1/edit
  def edit
    @corte = Corte.find(params[:id])
  end

  # POST /cortes
  # POST /cortes.json
  def create
    @corte = Corte.new(params[:corte])
    @sales = Sale.no_corte
    @gastos = Gasto.no_corte

    @corte.total_venta = @sales.sum(:total)
    @corte.total_gastos = @gastos.sum(:precio)

    respond_to do |format|
      if @corte.save
        @sales.each do |sale|
          sale.update_attribute(:corte_id, @corte.id)
        end
        @gastos.each do |gasto|
          gasto.update_attribute(:corte_id, @corte.id)
        end
        
        format.html { redirect_to @corte, notice: 'Corte was successfully created.' }
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
    @corte = Corte.find(params[:id])

    respond_to do |format|
      if @corte.update_attributes(params[:corte])
        format.html { redirect_to @corte, notice: 'Corte was successfully updated.' }
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
    @corte = Corte.find(params[:id])
    @corte.destroy

    respond_to do |format|
      format.html { redirect_to cortes_url }
      format.json { head :no_content }
    end
  end
end
