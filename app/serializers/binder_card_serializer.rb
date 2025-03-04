class BinderCardSerializer
  include JSONAPI::Serializer
  set_type :binder_card

  attribute :binder do |binder_card|
    {
      id: binder_card.binder.id,
      name: binder_card.binder.name,
    }
  end

  attribute :card do |binder_card|
    {
      name: binder_card.card.name,
      image_url: binder_card.card.image_url,
      category: binder_card.card.category
    }
  end

  attribute :favorite do |binder_card|
    {
      favorite: binder_card.favorite
    }
  end
end
