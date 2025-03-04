require "rails_helper"

RSpec.describe BinderCard, type: :model do
  describe "validations" do
    it { should validate_presence_of(:binder) }
    it { should validate_presence_of(:card) }
    it { should validate_inclusion_of(:favorite).in_array([true, false]) }
  end

  describe "associations" do
    it { should belong_to :binder }
    it { should belong_to :card }
  end

  describe "add_card_to_favorites(binder_card)" do
    it 'will update a binder_cards favorite attribute to true if it exists' do
      binder = create(:binder)
      card = create(:card)
      binder_card = create(:binder_card, binder: binder, card: card, favorite: false)

      BinderCard.add_card_to_favorites(binder_card)
      expect(binder_card.reload.favorite).to be true
    end
  end
end