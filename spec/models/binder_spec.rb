require "rails_helper"

RSpec.describe Binder, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:user) }
  end

  describe "associations" do
    it { should belong_to :user }
    it { should have_many :binder_cards }
  end

  describe "Class Methods"
  it "Can find a users binder" do 
    user = @testuser = User.create(username: "testuser")
    card1 = 
  end
end