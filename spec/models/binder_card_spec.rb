require "rails_helper"

RSpec.describe BinderCard, type: :model do
  describe "validations" do
    it { should validate_presence_of(:binder) }
    it { should validate_presence_of(:card) }
    it { should validate_presence_of(:favorite) }
  end

  describe "associations" do
    it { should belong_to :binder }
    it { should belong_to :card }
  end
end