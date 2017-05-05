require 'rails_helper'

RSpec.describe Post, type: :model do
  # validation tests
  it { is_expected.to validate_presence_of(:title) }

  # association tests
  it { is_expected.to belong_to(:author) }
  it { is_expected.to have_many(:comments) }
end
