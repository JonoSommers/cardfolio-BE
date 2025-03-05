require 'rails_helper'
require 'pry'
RSpec.describe "Binder Controller", type: :request do 

  before :each do 
    User.delete_all
    @testuser = User.create(username: "testuser")
    @testuser2 = User.create(username: "testuser2")
  end

  describe "create Action" do 
    it "Can create new binder" do 
      binder_params = {
        "binder_name": "My Pokemon Cards"
      }

      post "http://localhost:3000/api/v1/users/#{@testuser.id}/binders", params: binder_params, as: :json
      json = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(json[:id]).to be_a(String)
      expect(json[:type]).to be_a(String)
      expect(json[:type]).to eq("binder")
      expect(json[:attributes]).to be_a(Hash)
      expect(json[:attributes][:name]).to be_a(String)
      expect(json[:attributes][:name]).to eq("My Pokemon Cards")
      expect(json[:attributes][:user_id]).to be_a(Integer)
    end

  end

  describe "Update Action" do
    it "Can update binder name" do
      binder_params = {
        "binder_name": "My Tournament Deck" 
      }
      
      patch "http://localhost:3000/api/v1/users/#{@testuser.id}/binders/#{@testuser.binders[0].id}", params: binder_params, as: :json
      json = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(json[:attributes][:name]).to be_a(String)
      expect(json[:attributes][:name]).to eq("My Tournament Deck")
    end
  end

  describe "Shows a 400 error" do 
    it "Can show a status 400 error" do
      binder_params = {
        "binder_name": "My Tournament Deck" 
      }

      post "http://localhost:3000/api/v1/users/#{@testuser.id}/binders", params: binder_params, as: :json
      post "http://localhost:3000/api/v1/users/#{@testuser.id}/binders", params: binder_params, as: :json
  
      expect(response.status).to eq(422)
      json = JSON.parse(response.body, symbolize_names: true)
      
      expect(json[:errors]).to be_present
    end
  end
end