class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many :binders, dependent: :destroy
    has_many :binder_cards, through: :binders
    after_create :create_default_binder

    def create_default_binder
      self.binders.create(name: "Default Binder")
    end

    def new_binder_creation(binder_name)
      if binders.count < 2
        return binders.create(name: binder_name)
      end
    end
end