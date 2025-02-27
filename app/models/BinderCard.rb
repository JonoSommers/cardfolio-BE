class BinderCard < ApplicationRecord
    validates: binders, presence: true
    validates: card, presence: true
    validates: favorite, presence: true

    has_many :cards, through: :binders
    has_many :binders
end