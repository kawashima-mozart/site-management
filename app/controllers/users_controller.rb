class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @events = @user.events.select(
      "id AS id,
      title AS title,
      start_day AS start,
      end_day AS end,
      memo AS description"
    ).as_json
    
    respond_to do |format|
      format.html
      format.json {render :json => @events}
    end
  end

  

end
