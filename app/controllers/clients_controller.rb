class ClientsController < ApplicationController
  def index
    @clients = current_company.clients
  end

  def show
    @client = current_company.clients.find(params[:id])
  end

  def new
    @client = current_company.clients.build
  end

  def create
    @client = current_company.clients.build(params[:client])
    if @client.save
      #redirect_to @client, :notice => "Successfully created client."
      render 'search'
    else
      render :action => 'new'
    end
  end

  def edit
    @client = current_company.clients.find(params[:id])
  end

  def search
    @client = current_company.clients.find_by_phone(params[:phone])

    respond_to do |format|
      format.js
    end

  end


  def update
    @client = current_company.clients.find(params[:id])
    if @client.update_attributes(params[:client])
      redirect_to @client, :notice  => "Successfully updated client."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @client = current_company.clients.find(params[:id])
    @client.destroy
    redirect_to clients_url, :notice => "Successfully destroyed client."
  end
end
