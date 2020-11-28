class BusinessSchedulesController < ApplicationController

  def new
    @user_business_schedule = UserBusinessSchedule.new
  end

  def create
    @user_business_schedule = UserBusinessSchedule.new(business_params)
    if @user_business_schedule.valid?
      @user_business_schedule.save
      redirect_to site_path(params[:site_id])
    else
      render :new
    end
  end

  private

  def business_params
    params.require(:user_business_schedule).permit(:business_content_id, :survey_id, :development_id, :order_day, :delivery_day, :name, :start, :done, :user_id).merge(site_id: params[:site_id])
  end
  
end
