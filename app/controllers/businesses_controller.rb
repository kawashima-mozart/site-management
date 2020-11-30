class BusinessesController < ApplicationController
  before_action :set_business, only: [:edit, :update, :destroy] 

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    if @business.save
      redirect_to site_path(params[:site_id])
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @business.update
      redirect_to site_path(params[:site_id])
    else
      render :edit
    end
  end

  def destroy
    @business.destroy
    redirect_to site_path(params[:site_id]), notice: '業務が削除されました'
  end

  private

  def business_params
    params.require(:business).permit(:business_content_id, :survey_id, :development_id, :order_day, :delivery_day, :survey_day).merge(site_id: params[:site_id], user_id: params[:user_id])
  end

  def set_business
    @business = Business.find(params[:id])
  end

end
