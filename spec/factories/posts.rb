FactoryGirl.define do
  factory :post do
    title "A Test Post"
    body "This is some text for a the test post."
    association :author, factory: :user
  end
end
