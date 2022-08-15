require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }
  before { subject.save }

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with postcounter in string type' do
      subject.posts_count = 'er'
      expect(subject).to_not be_valid
    end

    it 'is valid without a photo or bio' do
      subject.photo = nil
      subject.bio = nil
      expect(subject).to be_valid
    end
  end
  context 'associations' do
    it 'has many posts' do
      assc = described_class.reflect_on_association(:posts)
      expect(assc.macro).to eq :has_many
    end
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
      expect(subject.three_laster_posts.count).to eq(subject.posts.order('created_at').last(3).count)
    end
  end
end
