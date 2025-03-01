require 'rails_helper'

RSpec.describe "BinderCards Controller", type: :request do
  before :each do
    @testuser = User.create(username: "testuser")
    @testuser2 = User.create(username: "testuser2")
  end
  describe "Create Action" do
    it "Can add cards to a users binder" do
      card_params = {
        "name": "test_card",
        "image_url": "http://www.test_url.com/",
        "category": "pokemon"
      }

      post "/api/v1/users/#{@testuser.id}/binders/#{@testuser.binders[0].id}/binder_cards", params: card_params, as: :json
      json = JSON.parse(response.body, symbolize_names: true)[:data][:binder_card]

      expect(json[:name]).to eq("test_card")
      expect(json[:attributes][:image_url]).to eq("http://www.test_url.com/")
      expect(json[:attributes][:category]).to eq("pokemon")
    end

    it "Can add the same card to multiple users binders" do
      card_params = {
        "name": "test_card2",
        "image_url": "http://www.test_url2.com/",
        "category": "pokemon"
      }

      post "/api/v1/users/#{@testuser.id}/binders/#{@testuser.binders[0].id}/binder_cards", params: card_params, as: :json
      json = JSON.parse(response.body, symbolize_names: true)[:data][:binder_card]
      post "/api/v1/users/#{@testuser2.id}/binders/#{@testuser2.binders[0].id}/binder_cards", params: card_params, as: :json
      json2 = JSON.parse(response.body, symbolize_names: true)[:data][:binder_card]

      expect(json[:name]).to eq("test_card2")
      expect(json[:attributes][:image_url]).to eq("http://www.test_url2.com/")
      expect(json[:attributes][:category]).to eq("pokemon")
      expect(json2[:name]).to eq("test_card2")
      expect(json2[:attributes][:image_url]).to eq("http://www.test_url2.com/")
      expect(json2[:attributes][:category]).to eq("pokemon")
    end
  end
end