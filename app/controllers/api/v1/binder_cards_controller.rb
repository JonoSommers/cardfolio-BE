class Api::V1::BinderCardsController < ApplicationController
  def create
    user = User.find_by(id: params[:user_id])
    binder_card = Card.create_new_card(card_params, user, params[:binder_id])
    render json: BinderCardSerializer.binder_card_created_confirmation(binder_card.card)
  end

  private

  def card_params
    params.permit(:name, :image_url, :category)
  end
end