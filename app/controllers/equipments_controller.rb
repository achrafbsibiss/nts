class EquipmentsController < ApplicationController

  before_action :set_equipment, only: %i[edit update destroy]

  def index
    @equipments = Equipment.all
  end

  def edit
  end

  def new
    @equipment = Equipment.new
  end

  def create
    puts "hello+++++++++++++++++++++++++++++++++++++"
    @equipment = Equipment.new(equipment_prams)
    if @equipment.save
      redirect_to equipments_path
    else
      render :new
    end
  end

  def update
    puts "hello+++++++++++++++++++++++++++++++++++++"
    if @equipment.update(equipment_prams)
      redirect_to equipments_path
    else
      render :edit
    end
  end

  def destroy
    @equipment.destroy
    flash.now[:notice] = t("flash.successfully_destroyed")
    render turbo_stream: [
      turbo_stream.remove(@role),
      turbo_stream.replace("notification_alert", partial: "layouts/alert")
    ]
  end

  private

  def set_equipment
    @equipment = Equipment.find(params[:id])
  end

  def equipment_prams
    params.require(:equipment).permit(:name, :code, :site_id, :equipment_type)
  end
end
