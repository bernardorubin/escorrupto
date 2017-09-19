class CommentsController < ApplicationController
  before_action :find_commentable
  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new comment_params

    if @comment.save
      redirect_back fallback_location: targets_path, notice: 'Your comment was successfully posted!'
    else
      redirect_back fallback_location: targets_path, notice: "Your comment wasn't posted!"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Target.find_by_id(params[:target_id]) if params[:target_id]
  end

end
