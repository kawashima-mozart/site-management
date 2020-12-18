class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    redirect_to edit_site_business_path(params[:site_id], params[:business_id])
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, business_id: params[:business_id])
  end
end
