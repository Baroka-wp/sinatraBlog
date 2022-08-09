class Post < ApplicationRecord
  # order posts by created_at DESC (from newest to oldest)
  default_scope -> { order(created_at: :desc) }
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :text, presence: true
  validates :title, presence: true

  def update_posts_counter
    user.update(postsCounter: user.posts.count)
  end

  def five_laster_comments
    comments.order('created_at').last(5)
  end
end
