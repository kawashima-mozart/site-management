class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to users_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :start_day, :end_day, :memo, :business_id).merge(business_id: params[:business_id], user_id: current_user.id)
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
