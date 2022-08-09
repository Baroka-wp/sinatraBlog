class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user

  def update_like_counter
    post.update(likesCounter: user.likes.count)
  end
end
