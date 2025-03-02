class Api::V1::BindersController < ApplicationController

  def create
    user = User.find_by(id: params[:user_id])
    new_binder = user.new_binder_creation(binder_params[:binder_name])
    render json: BindersSerializer.binder_created_confirmation(new_binder)
  end

  private

  def binder_params
    params.permit(:binder_name)
  end
end