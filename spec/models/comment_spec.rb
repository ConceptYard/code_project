require 'rails_helper'

RSpec.describe Comment, type: :model do
  # validation tests
  it { is_expected.to validate_presence_of(:body) }

  # association tests
  it { is_expected.to belong_to(:author) }
  it { is_expected.to belong_to(:post) }
end
