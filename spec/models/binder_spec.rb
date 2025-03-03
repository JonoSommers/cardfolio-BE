require "rails_helper"

RSpec.describe Binder, type: :model do

  before :each do 
    User.delete_all
    @testuser = User.create(username: "testuser")
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:user) }
  end

  describe "associations" do
    it { should belong_to :user }
    it { should have_many :binder_cards }
  end

  describe "Class Methods" do
    it "Can find a users binder" do 
      user_info = {user: @testuser, binder_id: @testuser.binders[0].id}
      test_card = Card.create!(name: "test_card", image_url: "http://test_url.com", category: 0)
      binder_card_id = test_card.id

      new_binder_card = @testuser.binders.find_users_binder(user_info, binder_card_id)

      expect(@testuser.binders[0].binder_cards.count).to eq(1)
      expect(@testuser.binders[0].binder_cards[0].id).to be_a(Integer)
      expect(@testuser.binders[0].binder_cards[0].binder_id).to be_a(Integer)
      expect(@testuser.binders[0].binder_cards[0].binder_id).to eq(@testuser.binders[0].id)
      expect(@testuser.binders[0].binder_cards[0].card_id).to eq(test_card.id)
      expect(@testuser.binders[0].binder_cards[0].favorite).to be_in([true, false])
    end
  end

  describe "Instance Methods" do
    it "Prevents a user from creating more than 2 binders" do 
      second_binder = @testuser.binders.create(name: "My Second Binder")
      expect(second_binder).to be_instance_of(Binder)
      expect(@testuser.binders.count).to eq(2)

      third_binder = @testuser.binders.create(name: "My Third Binder")
      expect(third_binder).not_to be_valid
      expect(third_binder.errors[:message]).to include("Users can only have two binders!")
    end
  end
end