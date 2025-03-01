class BinderCard < ApplicationRecord
    validates :binder, presence: true
    validates :card, presence: true, uniqueness: true
    

    belongs_to :binder
    belongs_to :card
end