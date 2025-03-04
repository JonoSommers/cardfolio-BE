FactoryBot.define do
    factory :binder do
        name { "Default Binder" }
        association :user

    end
end