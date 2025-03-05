class Api::V1::BinderCardsController < ApplicationController
  def create
    user = User.find_by(id: params[:user_id])
    binder = Binder.find_by(id: params[:binder_id]) 
    card = Card.create_new_card(card_params, { user: user, binder_id: params[:binder_id]})
    render json: BinderCardSerializer.new(card)
  end

  def update
    user = User.find_by(id: params[:user_id])
    binder = user.binders.find_by(id: params[:binder_id])
    binder_card = binder.binder_cards.find_by(id: params[:id])
    BinderCard.add_card_to_favorites(binder_card)
    render json: BinderCardSerializer.new(binder_card)
  end

  private

  def card_params
    params.permit(:name, :image_url, :category)
  end
end