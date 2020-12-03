class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy, :show]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to user_path(current_user.id)
    else
      flash.now[:alert] = 'スケジュールが保存されませんでした'
      render :new
    end
  end

  def edit
  end

  def update
    if@event.save
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to user_path(current_user.id)
  end

  private
  
  def event_params
    params.require(:event).permit(:title, :start_day, :end_day, :memo, :business_id).merge(business_id: params[:business_id], user_id: current_user.id )
  end

  def set_event
    @event = Event.find(:id)
  end

end
