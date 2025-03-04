class Api::V1::BinderCardsController < ApplicationController
  def create
    user = User.find_by(id: params[:user_id])
    binder = Binder.find_by(id: params[:binder_id]) 
    card = Card.create_new_card(card_params, { user: user })
    
    # Create the BinderCard and associate it with the binder and card
    binder_card = binder.binder_cards.create!(card: card)


    render json: BinderCardSerializer.new(binder_card)
  end
  private

  def card_params
    params.permit(:name, :image_url, :category)
  end
end