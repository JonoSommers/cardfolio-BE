RSpec.describe Card, type: :model do
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
      testuser = User.create(username: "testuser")
      card_params = {
        name: "test_card",
        image_url: "http://www.test_url.com/",
        category: 0
      }
      user_info = {user: testuser, binder_id: testuser.binders[0].id}
      binder_card = Card.create_new_card(card_params, user_info)
      binding.pry
      expect(binder_card).to be_instance_of(BinderCard)
    
    end

    it "confirms no duplicate cards when adding a card" do 

    end
  end
end