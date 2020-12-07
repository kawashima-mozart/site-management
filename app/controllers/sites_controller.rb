class SitesController < ApplicationController
  before_action :set_site, only: [:edit, :update, :show, :destroy]
  def index
    @sites = Site.all.order(created_at: :asc)
    @businesses = current_user.businesses.joins(:comments).includes(:comments).order("comments.created_at desc").limit(10)
    @events = current_user.events.includes(:business)
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
    @businesses = @site.businesses.includes(:user).order(created_at: :asc)
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
