class BindersSerializer
  include JSONAPI::Serializer
  attributes :name, :id

  def self.binder_created_confirmation(new_binder)
    { 
      data: {
        binder: {
          attributes: {
            id: new_binder.id,
            name: new_binder.name
          }
        }
      }
    }
  end
end
