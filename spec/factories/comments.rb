FactoryGirl.define do
  factory :comment do
    body "That test post is really boring."
    author_id 1
    post_id 1
    parent_id 1
  end
end
