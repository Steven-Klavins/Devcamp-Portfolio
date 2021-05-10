class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @comment.update(blog_id: params[:blog_id]) # ID passed form comments form

    if @comment.save
      ActionCable.server.broadcast "BlogsChannel",
                                   { content: @comment.content }
    end
    head :no_content
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
