class UserSerializer
  include JSONAPI::Serializer
  set_type :user
  attributes :username

  attribute :binders do |user|
    user.binders.map do |binder|
      { 
        id: binder.id, 
        name: binder.name,
        binders_cards: binder.binder_cards.map { |bc| BinderCardSerializer.new(bc) }
      } 
    end
  end
end