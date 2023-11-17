class ClientsController < ApplicationController
  before_action :set_client, only: %i[edit update destroy];

  def index
    @q = Client.ransack(params[:q])
    @clients = @q.result(distinct: true).page(params[:page])
  end

  def new 
    @client = Client.new
    authorize!
  end

  def edit
  end

  def create
    authorize!
    @client = Client.new(client_params)
    if @client.save
      redirect_to clients_path, notice: t("flash.successfully_created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @client.update(client_params)
      redirect_to clients_path, notice: t("flash.successfully_updated")
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @client.destroy
    redirect_to clients_path, notice: t("flash.successfully_destroyed")
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:logo, :name, :responsible_name, :responsible_email, :phone, :adress, :city, :code_postal )
  end
end
