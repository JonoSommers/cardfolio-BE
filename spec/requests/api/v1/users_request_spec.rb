require 'rails_helper'

RSpec.describe "User Controller", type: :request do
  describe "Create Action" do
    it "Can Create New User" do 
      user_params = {
        username: "bob123"
      }
      
      post "/api/v1/users", params: user_params, as: :json
      json = JSON.parse(response.body, symbolize_names: true)
      
      expect(json[:data][:attributes]).to eq("bob123")
    end
  end
end