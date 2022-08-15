class RenameCommentsCounterToCommentsCounter < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :commentsCounter, :comments_count
  end
end
