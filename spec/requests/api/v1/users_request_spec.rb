require 'rails_helper'

RSpec.describe "User Controller", type: :request do

  before :each do 
    User.delete_all
  end
  
  describe "Create Action" do
    it "Can Create New User" do 
      user_params = {
        username: "bob123"
      }
      
      post "/api/v1/users", params: user_params, as: :json
      json = JSON.parse(response.body, symbolize_names: true)[:data]
      
      expect(json[:id]).to be_a(String)
      expect(json[:type]).to be_a(String)
      expect(json[:type]).to eq("user")
      expect(json[:attributes]).to be_a(Hash)
      expect(json[:attributes][:username]).to be_a(String)
      expect(json[:attributes][:username]).to eq("bob123")
    end
  end
end