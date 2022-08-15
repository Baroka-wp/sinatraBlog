class Comment < ApplicationRecord
  # default_scope -> { order(created_at: :desc) }
  belongs_to :post, counter_cache: true
  belongs_to :user

  validates :text, presence: true

  def update_comment_counter
    post.update(comments_count: user.comments.count)
  end
end
