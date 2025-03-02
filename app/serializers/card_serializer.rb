class CardSerializer
  include JSONAPI::Serializer

  set_type :card
  attributes :name, :image_url, :category
end