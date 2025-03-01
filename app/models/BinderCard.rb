class BinderCard < ApplicationRecord
    validates :binder, presence: true
    validates :card, presence: true, uniqueness: { scope: :binder, message: "This card is already in your binder" }
    

    belongs_to :binder
    belongs_to :card

    def self.create_binder_card(users_binder, binder_card_id)
      return users_binder.binder_cards.create!(card_id: binder_card_id)
    end
end