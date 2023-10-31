class EquipmentsController < ApplicationController

  before_action :set_equipment, only: %i[edit update destroy]

  def index
    @q = Equipment.ransack(params[:q])
    @equipments = @q.result(distinct: true).page(params[:page])
  end

  def edit
  end

  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.new(equipment_prams)
    if @equipment.save
      redirect_to equipments_path, notice: t("flash.successfully_created")
    else
      render :new
    end
  end

  def update
    if @equipment.update(equipment_prams)
      redirect_to equipments_path, notice: t("flash.successfully_updated")
    else
      render :edit
    end
  end

  def destroy
    @equipment.destroy
    redirect_to equipments_path, notice: t("flash.successfully_destroyed")
  end

  private

  def set_equipment
    @equipment = Equipment.find(params[:id])
  end

  def equipment_prams
    params.require(:equipment).permit(:name, :code, :site_id, :equipment_type, :image)
  end
end
