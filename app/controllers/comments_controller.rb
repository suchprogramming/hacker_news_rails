class CommentsController < ApplicationController
  def index
    @comments = Comments.all
  end

  private
    def comment_params
      params.require(:comment).permit(:name, comment_text:)
    end
end
