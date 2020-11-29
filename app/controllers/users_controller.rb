class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id]) 
    @schedules = @user.schedules.includes(:user)
    @schedule = Schedule.new
  end 
end
