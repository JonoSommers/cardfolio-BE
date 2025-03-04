FactoryBot.define do
    factory :binder_card do
        association :binder
        association :card
    end
end