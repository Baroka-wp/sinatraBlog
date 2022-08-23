class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js { render :index }
        flash[:success] = 'Comment created successfully'
      else
        format.html { redirect_to user_post_path(current_user, @post) }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
