class Binder < ApplicationRecord
  validates :name, presence: true
  validates :user, presence: true
  validate :check_binder_limit, on: :create

  belongs_to :user
  has_many :binder_cards
  has_many :cards, through: :binder_cards

  def self.find_users_binder(user_info, binder_card_id)
    binder = user_info[:user].binders.find_by(id: user_info[:binder_id])
    return BinderCard.create_binder_card(binder, binder_card_id)
  end

  private

  def check_binder_limit
    return unless user

    if user.binders.count == 2
      errors.add(:message, "Users can only have two binders!")
    end
  end
end