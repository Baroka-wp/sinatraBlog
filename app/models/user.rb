class User < ApplicationRecord
  after_initialize :init

  # Assoicitions
  has_many :posts, dependent: :destroy, foreign_key: :user_id
  has_many :comments, dependent: :destroy, foreign_key: :user_id
  has_many :likes, dependent: :destroy, foreign_key: :user_id

  # Validations
  validates :name, presence: true
  validates :postsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Costum methods
  def three_laster_posts
    posts.order('created_at').last(3)
  end

  def init
    self.postsCounter ||= 0
  end
end
