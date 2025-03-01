class BinderCard < ApplicationRecord
    validates :binder, presence: true
    validates :card, presence: true, uniqueness: { scope: :binder, message: "This card is already in your binder" }
    

    belongs_to :binder
    belongs_to :card
end