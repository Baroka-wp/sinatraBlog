require 'rails_helper'

RSpec.describe 'Response body include correct placeholder', type: :feature do
    before(:each) do
        @user = User.create(
            name: 'Tom',
            photo: 'https://unsplash.com/photos/F_-0BxGuVvo', 
            bio: 'Teacher from Mexico.')
        @post = Post.create(
            title: 'Title',
            text: 'Body'
        )
    end
    describe 'Visit #index' do
        it 'content rigth content' do
            visit root_path
            expect(page).to have_content('User name')
        end
    end
    describe 'Visit #show' do
        it 'content user bio' do
            visit('/users/1')
            expect(page).to have_content('Bio')
        end
    end
end