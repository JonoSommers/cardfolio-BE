RSpec.describe Card, type: :model do
  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:image_url) }
    it { should validate_presence_of(:type) }
  end

  describe "associations" do
    it { should have_many :binder_cards }
    it { should have_many(:binders).through(:binder_cards) }
  end
end