require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do
  before :each do
    @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @user.confirm
  end
  path '/api/v1/users' do
    get('Get all users') do
      response(200, 'ok') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
