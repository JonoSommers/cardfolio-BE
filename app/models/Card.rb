class Card < ApplicationRecord
    validates :name, presence: true
    validates :image_url, presence: true
    validates :category, presence: true

    has_many :binder_cards
    has_many :binders, through: :binder_cards

    enum category: {pokemon: 0, magic_the_gathering: 1}

    def self.create_new_card(params)
        Card.create(name: params[:name], image_url: params[:image_url], category: params[:category])
    end
end