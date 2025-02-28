class Api::V1::UsersController < ApplicationController

  def Create
    User.create(username:params[:username])
  end

  private

  def user_params
    params.permit(:username)
  end
end