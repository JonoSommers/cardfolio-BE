class Card < ApplicationRecord
    validates :name, presence: true
    validates :image_url, presence: true, uniqueness: true
    validates :category, presence: true

    has_many :binder_cards
    has_many :binders, through: :binder_cards

    enum category: {pokemon: 0, magic_the_gathering: 1}

    def self.create_new_card(card_params, user_info)
      if check_existing_cards(card_params[:image_url])
        binder_card_id = check_existing_cards(card_params[:image_url])
      else
        card = create!(name: card_params[:name], image_url: card_params[:image_url], category: card_params[:category])
        binder_card_id = card.id
      end

      return Binder.find_users_binder(user_info, binder_card_id)
    end
    
    def self.check_existing_cards(card_img)
      if find_by(image_url: card_img)
        card = find_by(image_url: card_img)
        return card.id
      else
        return false
      end
    end
end