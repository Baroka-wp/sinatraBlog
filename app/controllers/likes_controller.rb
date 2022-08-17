class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build
    @like.user_id = current_user.id
    respond_to do |format|
      if @like.save
        # flash[:success] = 'Like created successfully'
      end
      format.html { redirect_to user_post_path(current_user, @post) }
    end
  end
end
