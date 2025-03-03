require "rails_helper"

RSpec.describe Card, type: :model do

  before :each do 
    User.delete_all
    @testuser = User.create(username: "testuser")
    @testuser2 = User.create(username: "testuser2")

    @card_params = {
      name: "test_card",
      image_url: "http://www.test_url.com/",
      category: 0
    }
  end
  
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:image_url) }
    it { should validate_presence_of(:category) }
  end

  describe "associations" do
    it { should have_many :binder_cards }
    it { should have_many(:binders).through(:binder_cards) }
  end

  describe "Class Methods" do 
    it "can create a new card" do
      user_info = {user: @testuser, binder_id: @testuser.binders[0].id}

      binder_card = Card.create_new_card(@card_params, user_info)

      expect(binder_card).to be_instance_of(BinderCard)
      expect(binder_card.card.id).to be_a(Integer)
      expect(binder_card.card.name).to eq("test_card")
      expect(binder_card.card.image_url).to eq("http://www.test_url.com/")
      expect(binder_card.card.category).to eq("pokemon")
    
    end

    it "confirms no duplicate cards when adding a card" do 
      user_info = {user: @testuser, binder_id: @testuser.binders[0].id}
      user_info2 = {user: @testuser2, binder_id: @testuser2.binders[0].id}

      binder_card = Card.create_new_card(@card_params, user_info)
      binder_card2 = Card.create_new_card(@card_params, user_info2)

      expect(binder_card).to be_instance_of(BinderCard)
      expect(binder_card2).to be_instance_of(BinderCard)
      expect(binder_card2.card_id).to eq(binder_card.card_id)
    end
  end
end