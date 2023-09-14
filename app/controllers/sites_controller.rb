class SitesController < ApplicationController
  before_action :set_site, only: [:edit, :update, :destory]

  def index
    @sites = Site.all
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
    else
      render :new
    end
  end

  def update
    if @site.update(site_params)
      redirect_to sites_path
    else
      render :edit
    end
  end
  
  def destroy
    @site.destroy
  end

  private

  def set_site
    @site = Site.find(params[:id])
  end

  def site_params
    params.require(:site).permit(:name, :city, :adresse, :phone, :description)
  end
end
