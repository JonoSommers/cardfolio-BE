class Api::V1::BindersController < ApplicationController

  def create
    user = User.find_by(id: params[:user_id])
    new_binder = user.binders.create!(name: binder_params[:binder_name])
    render json: BinderSerializer.new(new_binder)
  end

  def update
    user = User.find_by(id: params[:user_id])
    binder = user.binders.find_by(id: params[:id])
    binder.update(name: binder_params[:binder_name]) 
    render json: BinderSerializer.new(binder)
  end

  private

  def binder_params
    params.permit(:binder_name)
  end
end