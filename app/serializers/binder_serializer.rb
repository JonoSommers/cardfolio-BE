class BinderSerializer
  include JSONAPI::Serializer
  set_type :binder
  attributes :name, :user_id

end
