class UserSerializer
  include JSONAPI::Serializer
  set_type :user
  attributes :username, :binders
end
