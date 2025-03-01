class Binder < ApplicationRecord
    validates :name, presence: true
    validates :user, presence: true

    belongs_to :user
    has_many :binder_cards

    def self.find_users_binder(user, binder_id, binder_card_id)
      return BinderCard.create_binder_card(user.binders.find_by(id: binder_id), binder_card_id)
    end
end