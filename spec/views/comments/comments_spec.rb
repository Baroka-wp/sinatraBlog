require 'rails_helper'

RSpec.describe Comment, type: :view, js: true do
  before :each do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @user.posts.create(title: 'Title', text: 'Body')
  end

  it 'Should display comment counter' do
    visit root_path
    click_link 'Tom'
    expect(page).to have_content('See all posts')
  end

  it 'Should display comment counter' do
    visit user_posts_path(@user.id)
    expect(page).to have_content('0 comment')
  end

  it 'Should display comment counter in post view' do
    visit user_posts_path(@user.id)
    click_link 'Title'
    expect(page).to have_content('0 comment')
  end

  # it 'Should add comment' do
  #   visit user_post_path(@user.id, @user.posts.first.id)
  #   fill_in 'comment[text]', with: 'New Comment'
  #   click_button 'Submit new comment'
  #   response.
  #   expect(current_path).to eq(user_post_path(@user.id, @user.posts.first.id))
  #   expect(page).to have_content('New Comment')
  # end
end
