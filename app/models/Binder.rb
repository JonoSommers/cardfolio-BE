class Binder < ApplicationRecord
    validates :name, presence: true
    validates :user, presence: true

    belongs_to :user
    has_many :binder_cards

    def self.find_users_binder(user, binder_id)
      return user.binders.find_by(id: binder_id)
    end
end