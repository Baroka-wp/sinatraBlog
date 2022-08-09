class Comment < ApplicationRecord
    belongs_to :post
	belongs_to :user

    validates :text, presence: true

    def update_comment_counter(post_id)
        post = Post.find_by(id: post_id)
        post.update(commentsCounter: user.comments.count)
    end
end
