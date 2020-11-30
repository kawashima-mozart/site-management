class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:edit, :update, :destroy, :show]

  def new
    @schedule = Schedule.new
  end

  def create
    @schedule =Schedule.new(schedule_params)
    if @schedule.save
      redirect_to _path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @schedule.update
      redirect_to _path
    else
      render :edit
    end
  end

  def destroy
    @schedule.destroy
    redirect_to _path
  end

  def show
  end

  private

  def schedule_params
    params.require(:schedule).permit(:name, :start, :done, user_ids:[]).merge(business_id: params[business_id])
  end

  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

end
