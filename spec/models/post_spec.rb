require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  end

  context 'validations' do
    it 'is valid with valid attributes' do
      post = Post.create(title: 'Title', text: 'Body', user_id: @user.id)
      expect(post).to be_valid
    end
    it 'is not valid without a title' do
      post = Post.create(title: nil, text: 'Body', user_id: @user.id)
      expect(post).to_not be_valid
    end
    it 'is not valid with a title exceed 250 characters' do
      title = 'a' * 251
      post = Post.create(title: title, text: 'Body', user_id: @user.id)
      expect(post).to_not be_valid
    end
  end
  context 'validations 2' do
    it 'is valid without a text' do
      post = Post.create(title: 'title', text: nil, user_id: @user.id)
      expect(post).to_not be_valid
    end
    it 'is not valid without a user_id' do
      post = Post.create(title: 'title', text: 'Body')
      expect(post).to_not be_valid
    end
    it 'is not valid with commentsCounter in string type' do
      post = Post.new(title: 'title', text: 'Body', user_id: @user.id)
      post.comments_count = 'string'
      expect(post).to_not be_valid
    end
    it 'is not valid with likesCounter in string type' do
      post = Post.new(title: 'title', text: 'Body', user_id: @user.id)
      post.likes_count = 'string'
      expect(subject).to_not be_valid
    end
  end
  context 'associations' do
    it 'has many comments' do
      assc = described_class.reflect_on_association(:comments)
      expect(assc.macro).to eq :has_many
    end
    it 'has many likes' do
      assc = described_class.reflect_on_association(:likes)
      expect(assc.macro).to eq :has_many
    end
  end
  context 'Costum methods' do
    it 'is showing the three last posts' do
      post = Post.new(title: 'title', text: 'Body', user_id: @user.id)
      expect(post.five_laster_comments.count).to eq(post.comments.order('created_at').last(5).count)
    end
  end
end
