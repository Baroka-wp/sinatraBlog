require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.create(title: 'Title', text: 'Body', user_id: @user.id)
  end

  context 'validations' do
    it 'is valid with valid attributes' do
      @like = @user.likes.create(post_id: @post.id)
      expect(@like).to be_valid
    end
    it 'is not valid without a post_id' do
      @like = @user.likes.create
      expect(@like).to_not be_valid
    end
    it 'is not valid without a user_id' do
      @like = @post.likes.create
      expect(@like).to_not be_valid
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
    it 'update post like count' do
      @like = @user.likes.create(post_id: @post.id)
      @like.update_like_counter
      expect(@like.post.likes_count).to eq(1)
    end
  end
end
