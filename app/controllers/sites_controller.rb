class SitesController < ApplicationController
  before_action :set_site, only: [:edit, :update, :show, :destroy]
  def index
    @sites = Site.all
  end
  
  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    if @site.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @site.update(site_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def show
    @marker = Marker.new
    @markers = @site.markers.order(created_at: :asc)
    @neighbors = @site.neighbors.order(created_at: :asc)
    @businesses = @site.businesses.order(created_at: :asc)
  end

  def destroy
    @site.destroy
    redirect_to root_path
  end

  private
  
  def site_params
    params.require(:site).permit(:name, :customer)
  end

  def set_site
    @site = Site.find(params[:id])
  end
end
