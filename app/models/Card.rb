class Card < ApplicationRecord
    validates :name, presence: true
    validates :image_url, presence: true, uniqueness: true
    validates :category, presence: true

    has_many :binder_cards
    has_many :binders, through: :binder_cards

    enum category: {pokemon: 0, magic_the_gathering: 1}

    def self.create_new_card(card_params)
      if check_existing_cards(card_params[:image_url])
        return check_existing_cards(card_params[:image_url])
      else
        card = Card.create(name: card_params[:name], image_url: card_params[:image_url], category: :"#{card_params[:category]}")
        return card.id
      end
    end
    
    def self.check_existing_cards(card_img)
      if Card.find_by(image_url: card_img)
        card = Card.find_by(image_url: card_img)
        return card.id
      else
        return false
      end
    end
end