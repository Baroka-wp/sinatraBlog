class Post < ApplicationRecord
  # order posts by created_at DESC (from newest to oldest)
  # default_scope -> { order(created_at: :desc) }
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :text, presence: true, length: { maximum: 250 }
  validates :title, presence: true
  validates :commentsCounter,
            :likessCounter, numericality: { only_integer: true , greater_than_or_equal_to: 0}
            
  def update_posts_counter
    user.update(postsCounter: user.posts.count)
  end

  def five_laster_comments
    comments.order('created_at').last(5)
  end
end
