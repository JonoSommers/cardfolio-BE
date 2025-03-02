class Binder < ApplicationRecord
    validates :name, presence: true
    validates :user, presence: true

    belongs_to :user
    has_many :binder_cards

    def self.find_users_binder(user_info, binder_card_id)
      binder = user_info[:user].binders.find_by(id: user_info[:binder_id])
      return BinderCard.create_binder_card(binder, binder_card_id)
    end
end