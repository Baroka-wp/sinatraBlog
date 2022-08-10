require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  subject { Post.new(title: 'Title', text: 'Body', user_id: user.id) }
  before { subject.save }

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
    it 'is not valid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid with a title exceed 250 characters' do
      subject.title = 'a' * 251
      expect(subject).to_not be_valid
    end
    it 'is valid without a text' do
      subject.text = nil
      expect(subject).to be_valid
    end
    it 'is not valid without a user_id' do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end
    it 'is not valid with commentsCounter in string type' do
      subject.commentsCounter = 'string'
      expect(subject).to_not be_valid
    end
    it 'is not valid with likesCounter in string type' do
      subject.likesCounter = 'string'
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
      expect(subject.five_laster_comments.count).to eq(subject.comments.order('created_at').last(5).count)
    end
  end
end
