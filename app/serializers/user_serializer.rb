class UserSerializer
  include JSONAPI::Serializer
  attributes :username

  def self.user_created_confirmation(user)
    {
      data: {
        attributes: "The username #{user.username} has been successfully created!"
      }
    }
    
  end
end
