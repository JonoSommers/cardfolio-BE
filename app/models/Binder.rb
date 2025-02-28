class Binder < ApplicationRecord
    validates :name, presence: true
    validates :user, presence: true

    belongs_to :user
    has_many :binder_cards
end