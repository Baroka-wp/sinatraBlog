class User < ApplicationRecord
    has_many :posts, dependent: :destroy, foreign_key: :user_id
    has_many :comments, dependent: :destroy, foreign_key: :user_id
	has_many :likes, dependent: :destroy, foreign_key: :user_id
    validates :name, presence: true, length: { maximum: 50 }

    def laster_post(user_id)
        Post.where(user_id: user_id).limit(3)
    end
end
