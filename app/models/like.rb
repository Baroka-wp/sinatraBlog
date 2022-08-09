class Like < ApplicationRecord
    belongs_to :post
	belongs_to :user

    def update_like_counter(post_id)
        post = Post.find_by(id: post_id)
        post.update(likesCounter: user.likes.count)
    end
end
