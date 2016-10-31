class CommentsController < ApplicationController
  def create
    @link = Link.find(params[:link_id])
    @comment = @link.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to :back
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :link_id, :user_id)
  end
end