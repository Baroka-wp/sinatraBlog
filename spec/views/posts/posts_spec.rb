require 'rails_helper'

RSpec.describe Post, type: :view do
  before :each do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @user.posts.create(title: 'Title', text: 'Body')
  end

  it 'Should content Add post button' do
    visit user_path(@user.id)
    expect(page).to have_content('Title')
    expect(page).to have_content('Add post')
  end

  it 'Should display add post form' do
    visit user_path(@user.id)
    click_link 'Add post'
    expect(current_path).to eq(new_post_path)
    expect(response).to render_template('new')
  end

  it 'Should create new post' do
    visit new_post_path
    fill_in 'post[title]', with: 'New Title'
    fill_in 'post[text]', with: 'New Body'
    click_button 'Submit new post'
    expect(current_path).to eq(user_posts_path(@user.id))
    expect(page).to have_content('New Title')
  end
end
