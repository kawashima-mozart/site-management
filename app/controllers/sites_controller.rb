class SitesController < ApplicationController
  before_action :set_site, only: [:edit, :update, :show, :destroy]
  def index
    @sites = Site.all.order(created_at: :asc)
    @businesses = current_user.businesses.includes(:site, comments: [:user]).order('comments.created_at desc')
    @events = current_user.events.includes(business: [:site])
    @q = Site.includes(businesses: [:user]).ransack(params[:q])
    @users = User.all
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
    @markers = @site.markers.includes([:images_attachments]).order(created_at: :desc)
    @neighbors = @site.neighbors.order(created_at: :asc)
    @businesses = @site.businesses.includes(:user).order(created_at: :asc)
  end

  def destroy
    @site.destroy
    redirect_to root_path
  end

  def search
    @q = Site.search(search_params)
    @results = @q.result.includes(businesses: [:user, { comments: [:user] }]).order(created_at: :desc)
  end

  private

  def site_params
    params.require(:site).permit(:name, :customer)
  end

  def set_site
    @site = Site.find(params[:id])
  end

  def search_params
    params.require(:q).permit(:businesses_user_id_eq, :name_cont)
  end
end
