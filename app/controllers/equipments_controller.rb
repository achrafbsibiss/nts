class EquipmentsController < ApplicationController

  before_action :set_equipment, only: %i[edit update destroy]
  before_action :set_breadcrumps, only: %i[create new edit update]
  before_action :set_edit_breadcrumps, only: %i[edit update]

  def index
    @q = Equipment.ransack(params[:q])
    @equipments = @q.result(distinct: true).page(params[:page])
  end

  def edit
    if @equipment.port_statuses.nil?
      @equipment.port_statuses = {}
    end
  end

  def new
    @equipment = Equipment.new
    @equipment.port_statuses = {}
    add_breadcrump(t("attributes.equipments.new"))
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

  def set_breadcrumps
    add_breadcrump(t("attributes.equipments.equipment"), equipments_path)
  end

  def set_edit_breadcrumps
    add_breadcrump(@equipment.name, equipment_path(@equipment))
    add_breadcrump(t("attributes.equipments.edit"))
  end

  def set_equipment
    @equipment = Equipment.find(params[:id])
  end

  def equipment_prams
    params.require(:equipment).permit(:name, :code, :site_id, :equipment_type, :image, :number_of_ports, port_statuses: {} )
  end
end
