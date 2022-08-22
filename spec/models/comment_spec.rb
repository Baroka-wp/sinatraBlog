require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.create(title: 'Title', text: 'Body', user_id: @user.id)
  end

  context 'validations' do
    it 'is valid with valid attributes' do
      comment = @user.comments.create(text:'comment', post_id: @post.id)
      expect(comment).to be_valid
    end
    it 'is not valid without a text' do
      comment = @user.comments.create(text: nil, post_id: @post.id)
      expect(subject).to_not be_valid
    end
    it 'is not valid without a user_id' do
      comment = @post.comments.create(text: "comment")
      expect(subject).to_not be_valid
    end
    it 'is not valid without a post_id' do
      comment = @user.comments.create(text: 'Comment')
      expect(comment).to_not be_valid
    end
  end
  context 'associations' do
    it 'belongs to a post' do
      assc = described_class.reflect_on_association(:post)
      expect(assc.macro).to eq :belongs_to
    end
    it 'belongs to a user' do
      assc = described_class.reflect_on_association(:user)
      expect(assc.macro).to eq :belongs_to
    end
  end
  context 'Costum methods' do
    it 'update post comment count' do
      comment = @user.comments.create(text:'comment', post_id: @post.id)
      comment.update_comment_counter
      expect(comment.post.comments_count).to eq(1)
    end
  end
end
