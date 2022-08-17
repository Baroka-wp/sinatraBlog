class Post < ApplicationRecord
  # order posts by created_at DESC (from newest to oldest)
  # default_scope -> { order(created_at: :desc) }
  validates_presence_of :title, :text
  validates :title, length: { maximum: 250 }
  validates :comments_count, :likes_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_initialize :init

  belongs_to :user, counter_cache: true
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def update_posts_counter
    user.update(posts_count: user.posts.count)
  end

  def five_laster_comments
    comments.order('created_at').last(5)
  end

  private

  def init
    self.comments_count ||= 0
    self.likes_count ||= 0
    true
  end
end
