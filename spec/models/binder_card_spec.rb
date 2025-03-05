require "rails_helper"

RSpec.describe BinderCard, type: :model do

  before :each do 
    User.delete_all
    @testuser = User.create(username: "testuser")
  end


  describe "validations" do
    it { should validate_presence_of(:binder) }
    it { should validate_presence_of(:card) }
    # it { should validate_inclusion_of(:favorite).in_array([true, false]) }
  end

  describe "associations" do
    it { should belong_to :binder }
    it { should belong_to :card }
  end

  describe "add_card_to_favorites(binder_card)" do
    it "adds a card to favorites" do
      binder = create(:binder)
      card = create(:card)
    
      binder_card = create(:binder_card, binder: binder, card: card, favorite: false)
    
      binder_card.add_card_to_favorites
      expect(binder_card.reload.favorite).to be true
    end
  end

  describe "Validates cards" do
  it "validates uniqueness of card within a binder" do
    binder = create(:binder)
    card = create(:card)
    
    create(:binder_card, binder: binder, card: card)

    binder_card = build(:binder_card, binder: binder, card: card)

    expect(binder_card.valid?).to be_falsey

    expect(binder_card.errors[:card]).to include("This card is already in your binder")
  end
end

end
