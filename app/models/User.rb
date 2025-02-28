class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many :binders
    has_many :binder_cards, through: :binders
end