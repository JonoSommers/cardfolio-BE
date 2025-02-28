require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
  end

  describe "associations" do
    it { should have_many :binders }
    it { should have_many(:binder_cards).through(:binders) }
  end
end