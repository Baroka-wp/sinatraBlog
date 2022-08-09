class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  validates :text, presence: true

  def update_comment_counter
    post.update(commentsCounter: user.comments.count)
  end
end
