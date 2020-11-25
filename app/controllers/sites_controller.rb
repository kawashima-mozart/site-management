class SitesController < ApplicationController
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

  private
  
  def site_params
    params.require(:site).permit(:name, :customer)
  end

end
