class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
     render json: {status: 'ok', message: 'Loaded users', data: @users}, status: :ok
  end

  def show
    @user = User.find(params[:id])
    render json: {status: 'ok', message: 'Loaded users', data: @user}, status: :ok
  end
end
