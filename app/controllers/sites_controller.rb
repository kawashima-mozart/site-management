class SitesController < ApplicationController
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

  def show
    @site = Site.find(params[:id])
    @marker = Marker.new
    @markers = @site.markers
  end

  private
  
  def site_params
    params.require(:site).permit(:name, :customer)
  end

end
