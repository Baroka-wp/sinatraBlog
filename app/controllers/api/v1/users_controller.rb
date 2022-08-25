class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    respond_to do |format|
      format.json { render :json => @users }
    end
  end

  def show
      @user = User.find(params[:id])
      render json: {
        user: @user
      }
  end

  private
  def get_user_from_token
    jwt_payload = JWT.decode(request.headers["Authorization"].split(' ')[1], 
              Rails.application.credentials.devise[:jwt_secret_key]).first
    user_id = jwt_payload['sub']
    user = User.find(user_id.to_s)
  end
end
