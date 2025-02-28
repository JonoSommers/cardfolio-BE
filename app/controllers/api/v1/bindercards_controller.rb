class Api::V1::BinderCardsController < ApplicationController
    def create
        binder_card = BinderCard.create(card_id:params[:card_id]) 
    end
end