class Api::V1::UsersController < ApplicationController

  def create
    user = User.create!(username: params[:username])
    render json: UserSerializer.new(user)
  end

  def show
    user = User.find_by(id: params[:id])
    render json: UserSerializer.new(user)
  end

  private

  def user_params
    params.permit(:username, :id)
  end
end