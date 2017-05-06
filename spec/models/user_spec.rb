describe User do

  before(:each) { @user = User.new(email: 'user@example.com') }

  subject { @user }

  it { should respond_to(:email) }

  it "#email returns a string" do
    expect(@user.email).to match 'user@example.com'
  end

  describe "#full_name" do

    it "should return email if no name values set" do
      expect(@user.full_name).to match 'user@example.com'
    end

    it "should return the concatenation of first_name and last_name" do
      @user.first_name = 'Robert'
      @user.last_name = 'Schmitt'
      expect(@user.full_name).to match 'Robert Schmitt'
    end

  end
end
