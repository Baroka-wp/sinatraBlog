class Like < ApplicationRecord
  belongs_to :post, counter_cache: true
  belongs_to :user

  def update_like_counter
    post.update(likes_count: user.likes.count)
  end
end
