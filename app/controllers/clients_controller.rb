class ClientsController < ApplicationController
  def index
    @clients = current_user.clients.all
  end

  def new
    @client = Client.new
    @client.address = Address.new
    @client.report = Report.new
    @client.report.address = Address.new
  end

  def create
    @client = current_user.clients.build(client_params)
    @client.report = Report.new
    @client.report.address = Address.new
    
    if @client.save
      redirect_to clients_path, notice: 'Your new clients information was saved.'
    else
      render :new, error: 'There was an error saving your clients information. Please try again.'
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])

    if @client.update_attributes(client_params)
      redirect_to clients_path, notice: "Client information updated."
    else
      render :edit, error: "There was an error updating your clients information. Please try again."
    end
  end

  def destroy
    @client = Client.find(params[:id])

    if @client.destroy
      redirect_to clients_path, notice: "Client information deleted."
    else
      redirect_to clients_path, error: "There was an error deleting your clients information. Please try again."
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :phone, :address_attributes => [:street, :city, :state, :zip, :category, :addressable_id, :addressable_type])
  end
end
