require "rails_helper"

RSpec.describe User, type: :model do

  before :each do 
    User.delete_all
  end
  
  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
  end

  describe "associations" do
    it { should have_many :binders }
    it { should have_many(:binder_cards).through(:binders) }
  end

  describe "instance methods" do
    it 'creates a default binder upon user creation' do
      user = User.create(username: "billy123")

      expect(user.binders[0][:name]).to eq("Default Binder")
    end
  end
end