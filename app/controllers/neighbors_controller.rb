class NeighborsController < ApplicationController
  before_action :seach_neighbor, only: [:edit, :update, :destroy]

  def new
    @neighbor = Neighbor.new
  end

  def create
    @neighbor = Neighbor.new(neighbor_params)
    if @neighbor.save
      redirect_to site_path(@neighbor.site.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @neighbor.update(neighbor_params)
      redirect_to site_path(params[:site_id])
    else
      render :edit
    end

  end

  def destroy
    @neighbor.destroy
    redirect_to site_path(params[:site_id])
  end

  private

  def neighbor_params
    params.require(:neighbor).permit(:lot_number, :name, :address, :address_now, :phone_number,:witness, :witness_day, :imprint, :imprint_day, :status_id, :memo).merge(site_id: params[:site_id]) 
  end

  def seach_neighbor
    @neighbor = Neighbor.find(params[:id])
  end
end
