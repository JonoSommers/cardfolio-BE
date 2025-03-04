require 'rails_helper'

RSpec.describe "User Controller", type: :request do

  before :each do 
    User.delete_all

  end
  
  describe "POST /api/v1/users" do
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

  describe 'GET /api/v1/user' do
    it 'can get all users' do
      user1 = create(:user, username: 'envytash')
      user2 = create(:user, username: 'jonbonsilver')
      user3 = create(:user, username: 'hannaMontana')
      user4 = create(:user, username: 'mattman')

      get "/api/v1/users/"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json[:data]).to be_a Array
      expect(json[:data].count).to eq(4)
      expect(json[:data].first[:attributes]).to include(:username)
    end
  end


  describe "GET /api/v1/users/:id" do 
    it "Can Show User" do
      user = create(:user, username: 'envytash')
      binder = create(:binder, name: "Poke Princess Things", user: user)

      card1 = create(:card, id: 1, name: "Latias", image_url: "https://images.pokemontcg.io/sv5/67.png", category: 0) 
      card2 = create(:card, id: 2, name: "Zapdos", image_url: "https://images.pokemontcg.io/base3/15.png", category: 0) 
      card3 = create(:card, id: 3, name: "Kyurem", image_url: "https://images.pokemontcg.io/bw9/31.png", category: 0) 
      
      create(:binder_card, binder: binder, card: card1)
      create(:binder_card, binder: binder, card: card2)
      create(:binder_card, binder: binder, card: card3)

      get "/api/v1/users/#{user.id}"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      response_json = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(response_json[:id]).to eq(user.id.to_s)
      expect(response_json[:type]).to eq("user")
      expect(response_json[:attributes]).to be_a(Hash)
      expect(response_json[:attributes][:username]).to eq("envytash")
      expect(response_json[:attributes][:binders].last[:name]).to eq("Poke Princess Things")
      expect(response_json[:attributes][:binders].last[:binders_cards]).to be_an(Array)
      expect(response_json[:attributes][:binders].last[:binders_cards].count).to eq(3)
      expect(response_json[:attributes][:binders].last[:binders_cards].map {|card| card[:data][:attributes][:card][:name]}).to include('Latias', 'Zapdos', 'Kyurem')

    end
  end
end