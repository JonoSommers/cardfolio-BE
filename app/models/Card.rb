class Card < ApplicationRecord
    validates :name, presence: true
    validates :image_url, presence: true
    validates :category, presence: true

    has_many :binder_cards
    has_many :binders, through: :binder_cards

    enum category: {pokemon: 0, magic_the_gathering: 1}

    def self.create_new_card(card_params)
      if find_existing_card(card_params[:name])
        return find_existing_card(card_params[:name])
      else
        card = Card.create(name: card_params[:name], image_url: card_params[:image_url], category: :"#{card_params[:category]}")
        return card.id
      end
    end
    
    def self.find_existing_card(card_name)
      if Card.find_by(name: card_name)
        card = Card.find_by(name: card_name)
        return card.id
      else
        return false
      end
    end
end