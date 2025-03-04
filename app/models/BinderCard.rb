class BinderCard < ApplicationRecord
    validates :binder, presence: true
    validates :favorite, inclusion: { in: [true, false] }
    validates :card, presence: true, uniqueness: { scope: :binder, message: "This card is already in your binder" }
    

    belongs_to :binder
    belongs_to :card

    def self.create_binder_card(binder, binder_card_id)
      return binder.binder_cards.create!(card_id: binder_card_id)
    end

    def self.add_card_to_favorites(binder_card)
      if binder_card
        binder_card.update(favorite: true)
      end
    end
end