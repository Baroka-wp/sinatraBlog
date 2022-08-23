class LikesController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build
    @like.user_id = current_user.id
    respond_to do |format|
      flash[:success] = 'Like created successfully' if @like.save
      format.html { redirect_to user_post_path(current_user, @post) }
    end
  end
end
