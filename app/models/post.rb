class Post < ApplicationRecord
    # order posts by created_at DESC (from newest to oldest)
    default_scope -> { order(created_at: :desc) }
    belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy

    validates :text, presence: true
    validates :title, presence: true

    def update_posts_counter
        user.update(postCounter: user.posts.count)
    end

    def most_recent_comment(post_id)
        post = Post.find_by(id: post_id)
        post.comments.limit(5)
    end
end
