class InventariosController < ApplicationController
  # GET /inventarios
  # GET /inventarios.json
  def index
    @inventarios = Inventario.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @inventarios }
    end
  end

  # GET /inventarios/1
  # GET /inventarios/1.json
  def show
    @inventario = Inventario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @inventario }
    end
  end

  # GET /inventarios/new
  # GET /inventarios/new.json
  def new
    @inventario = Inventario.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @inventario }
    end
  end

  # GET /inventarios/1/edit
  def edit
    @inventario = Inventario.find(params[:id])
  end

  # POST /inventarios
  # POST /inventarios.json
  def create
    @inventario = Inventario.new(params[:inventario])

    respond_to do |format|
      if @inventario.save
        format.html { redirect_to @inventario, notice: 'Inventario was successfully created.' }
        format.json { render json: @inventario, status: :created, location: @inventario }
      else
        format.html { render action: "new" }
        format.json { render json: @inventario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /inventarios/1
  # PUT /inventarios/1.json
  def update
    @inventario = Inventario.find(params[:id])

    respond_to do |format|
      if @inventario.update_attributes(params[:inventario])
        format.html { redirect_to @inventario, notice: 'Inventario was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @inventario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventarios/1
  # DELETE /inventarios/1.json
  def destroy
    @inventario = Inventario.find(params[:id])
    @inventario.destroy

    respond_to do |format|
      format.html { redirect_to inventarios_url }
      format.json { head :no_content }
    end
  end
end
