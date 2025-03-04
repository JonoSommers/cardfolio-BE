class Api::V1::UsersController < ApplicationController

  def index
    user = User.all 
    render json: UserSerializer.new(user)
  end

  def create
    user = User.create!(username: params[:username])
    render json: UserSerializer.new(user)
  end

  def show
    user = User.find(params[:id])
    render json: UserSerializer.new(user), status: :ok
  end

  private

  def user_params
    params.permit(:username)
  end
end