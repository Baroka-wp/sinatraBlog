class RenameLikesCounterToLikesCounter < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :likesCounter, :likes_count
  end
end
