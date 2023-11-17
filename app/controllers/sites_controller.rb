class SitesController < ApplicationController
  before_action :set_site, only: %i[:edit :update :destroy]

  def index
    @q = Site.ransack(params[:q])
    @sites = @q.result(distinct: true).page(params[:page])
  end

  def new
    @site = Site.new
  end

  def edit
  end

  def create
    @site = Site.new(site_params)
    if @site.save
      redirect_to sites_path
      flash[:notice] = t("flash.successfully_created")
    else
      render :new
    end
  end

  def update
    if @site.update(site_params)
      redirect_to sites_path
      flash.now[:notice] = t("flash.successfully_updated")
    else
      render :edit , status: :unprocessable_entity
    end
  end
  
  def destroy
    @site.destroy
    redirect_to sites_path
    flash[:notice] = t("flash.successfully_destroyed")
  end

  private

  def set_site
    @site = Site.find(params[:id])
  end

  def site_params
    params.require(:site).permit(:name, :city, :adresse, :phone, :description)
  end
end
