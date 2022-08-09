class Comment < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :post
  belongs_to :user

  validates :text, presence: true

  def update_comment_counter
    post.update(commentsCounter: user.comments.count)
  end
end
