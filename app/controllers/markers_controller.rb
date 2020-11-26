class MarkersController < ApplicationController

  def create
    marker = Marker.create(marker_params)
    redirect_to site_path(marker.site_id)
  end

  private

  def marker_params
    params.require(:marker).permit(:name, :name_cad, :type_id, :exist_id, :image).merge(site_id: params[:site_id])
  end
end
