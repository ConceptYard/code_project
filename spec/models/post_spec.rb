require 'rails_helper'

RSpec.describe Post, type: :model do
  # validation tests
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:body) }
  it { is_expected.to validate_presence_of(:author) }

  # association tests
  it { is_expected.to belong_to(:author) }
  it { is_expected.to have_many(:comments) }

  describe "#posted_at" do
    before(:each) do
      @post = FactoryGirl.create(:post)
      @posted_at_str = "Posted on #{@post.created_at.strftime("%B %d, %Y at %-l:%M %p")}"
    end

    it 'will display the time the post was created' do
      expect(@post.posted_at).to match @posted_at_str
    end
  end
end
