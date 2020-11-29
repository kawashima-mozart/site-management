class BusinessesController < ApplicationController
  before_action :set_business

  def edit
    @comments = @business.comments.includes(:user).order(created_at: :asc)
    @comment = Comment.new
  end

  def update
    if @business.update(business_params)
      redirect_to site_path(params[:site_id])
    else
      render :edit
    end
  end

  def destroy
    @business.destroy
    redirect_to site_path(params[:site_id])
  end

  private

  def business_params
    params.require(:business).permit()
  end

  def set_business
    @business = Business.find(params[:id])
  end

end
