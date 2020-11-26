class MarkersController < ApplicationController
  before_action :set_marker, only: [:edit, :update, :destroy]

  def create
    @marker = Marker.create(marker_params)
    redirect_to site_path(@marker.site.id)
  end

  def edit
  end

  def update
    @marker.update(marker_params)
    redirect_to site_path(@marker.site.id)
  end

  def destroy
    @marker.destroy
    redirect_to site_path(@marker.site.id)
  end

  private

  def marker_params
    params.require(:marker).permit(:name, :name_cad, :type_id, :exist_id, images:[]).merge(site_id: params[:site_id])
  end

  def set_marker
    @marker = Marker.find(params[:id])
  end
end
