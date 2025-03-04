require 'rails_helper'

RSpec.describe "BinderCards Controller", type: :request do

  before :each do
    User.delete_all
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
      json = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(json[:id]).to be_a(String)
      expect(json[:type]).to be_a(String)
      expect(json[:type]).to eq("binder_card")
      expect(json[:attributes]).to be_a(Hash)
      expect(json[:attributes][:favorite][:favorite]).to be_in([true, false])
      expect(json[:attributes][:favorite][:favorite]).to eq(false)
      expect(json[:attributes][:binder][:id]).to be_a(Integer)
      expect(json[:attributes][:binder][:name]).to be_a(String)
      expect(json[:attributes][:binder][:name]).to eq("Default Binder")
      expect(json[:attributes][:card][:name]).to be_a(String)
      expect(json[:attributes][:card][:name]).to eq("test_card")
      expect(json[:attributes][:card][:image_url]).to be_a(String)
      expect(json[:attributes][:card][:image_url]).to eq("http://www.test_url.com/")
      expect(json[:attributes][:card][:category]).to be_a(String)
      expect(json[:attributes][:card][:category]).to eq("pokemon")
    end

    it "Can add the same card to multiple users binders" do
      card_params = {
        "name": "test_card2",
        "image_url": "http://www.test_url2.com/",
        "category": "pokemon"
      }

      post "/api/v1/users/#{@testuser.id}/binders/#{@testuser.binders[0].id}/binder_cards", params: card_params, as: :json
      json = JSON.parse(response.body, symbolize_names: true)[:data]
      post "/api/v1/users/#{@testuser2.id}/binders/#{@testuser2.binders[0].id}/binder_cards", params: card_params, as: :json
      json2 = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(json[:type]).to eq("binder_card")
      expect(json[:attributes][:favorite][:favorite]).to be_in([true, false])
      expect(json[:attributes][:favorite][:favorite]).to eq(false)
      expect(json[:attributes][:binder][:id]).to be_a(Integer)
      expect(json[:attributes][:binder][:name]).to eq("Default Binder")
      expect(json[:attributes][:card][:name]).to eq("test_card2")
      expect(json[:attributes][:card][:image_url]).to eq("http://www.test_url2.com/")
      expect(json[:attributes][:card][:category]).to eq("pokemon")

      expect(json2[:type]).to eq("binder_card")
      expect(json2[:attributes][:favorite][:favorite]).to be_in([true, false])
      expect(json2[:attributes][:favorite][:favorite]).to eq(false)
      expect(json2[:attributes][:binder][:id]).to be_a(Integer)
      expect(json2[:attributes][:binder][:name]).to eq("Default Binder")
      expect(json2[:attributes][:card][:name]).to eq("test_card2")
      expect(json2[:attributes][:card][:image_url]).to eq("http://www.test_url2.com/")
      expect(json2[:attributes][:card][:category]).to eq("pokemon")
    end
  end
end