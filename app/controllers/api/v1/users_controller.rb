class Api::V1::UsersController < ApplicationController

  def create
    user = User.create!(username: params[:username])
    render json: UserSerializer.new(user)
  end

  private

  def user_params
    params.permit(:username)
  end
end