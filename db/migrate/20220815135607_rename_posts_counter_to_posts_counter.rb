class RenamePostsCounterToPostsCounter < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :postsCounter, :posts_count
  end
end
