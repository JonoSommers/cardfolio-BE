class Api::V1::BinderCardsController < ApplicationController
  def create
    user = User.find_by(id: params[:user_id])
    binder_card_id = Card.create_new_card(card_params)
    users_binder = Binder.find_users_binder(user, params[:binder_id])
    users_binder.binder_cards.create!(card_id: binder_card_id)
  end

  private

  def card_params
    params.permit(:name, :image_url, :category)
  end
end