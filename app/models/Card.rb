class Card < ApplicationRecord
    validates: name, presence: true
    validates: image_url, presence: true
    validates: type, presence: true

    belongs_to :binder_cards
    belongs_to :binders, through: :binder_cards

    enum type: {pokemon: 0, magic_the_gathering: 1}
end