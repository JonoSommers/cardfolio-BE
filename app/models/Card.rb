class Card < ApplicationRecord
    validates :name, presence: true
    validates :image_url, presence: true
    validates :type, presence: true, numericality: { only_integer: true }

    has_many :binder_cards
    has_many :binders, through: :binder_cards

    enum type: {pokemon: 0, magic_the_gathering: 1}
end