class BinderCardSerializer
  include JSONAPI::Serializer
  attributes :name, :image_url, :category

  def self.binder_card_created_confirmation(card)
    {
      data: {
        binder_card: {
          name: card.name,
          attributes: {
            image_url: card.image_url,
            category: card.category
          }
        }
      }
    }
  end
end
