class CommentsController < ApplicationController

  def new
    @link = Link.find(params[:link_id])
    @comment = @link.comments.new
  end

  def create
    @link = Link.find(params[:link_id])
    @comment = @link.comments.new(comment_params)
    if @comment.save
      flash[:notice] = 'Comment Added!'
      redirect_to link_path(@comment.link)
    else
      render :new
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:user_name, :comment_text)
  end
end
