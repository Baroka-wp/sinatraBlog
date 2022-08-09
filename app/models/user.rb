class User < ApplicationRecord
  has_many :posts, dependent: :destroy, foreign_key: :user_id
  has_many :comments, dependent: :destroy, foreign_key: :user_id
  has_many :likes, dependent: :destroy, foreign_key: :user_id
  validates :name, presence: true, length: { maximum: 50 }

  def three_laster_posts
    posts.order('created_at').last(3)
  end
end
