class Api::V1::CommentsController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, only: %i[create destroy]
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    respond_to do |format|
      format.json { render json: @comments, status: :ok }
    end
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.json { render json: { message: 'comment created successfully' }, status: :ok }
      else
        format.json { render json: { message: 'Erros' }, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.json { render json: { message: 'Comment deleted successfully' }, status: :ok }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
