class BinderCard < ApplicationRecord
    validates :binder, presence: true
    validates :favorite, inclusion: { in: [true, false] }
    validates :card, presence: true
    validate :card_uniqueness_within_binder

    belongs_to :binder
    belongs_to :card

    def self.create_binder_card(binder, binder_card_id)
      return binder.binder_cards.create!(card_id: binder_card_id)
    end

    def add_card_to_favorites
      if self
        self.update(favorite: true)
      end
    end

    private

  def card_uniqueness_within_binder
    if BinderCard.exists?(card_id: card.id, binder_id: binder.id)
      errors.add(:base, "This card is already in your binder")
    end
  end
end