class UserSerializer
  include JSONAPI::Serializer
  attributes :username

  def self.user_created_confirmation(user)
    {
      data: {
        attributes: user.username
      }
    }
    
  end
end
