require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe UserProfile do
  
  before(:each) do
    # run_factories(:default)
    @user = User.first
  end
  
  describe "email_address" do
  
    it "should be unique" do
      user_profile = UserProfile.new(:email_address => @user.user_profile.email_address)
      user_profile.should_not be_valid
      user_profile.errors.full_messages.should include("Email address is already taken")
    end
  
    it "should be present" do
      user_profile = UserProfile.new
      user_profile.should_not be_valid
      user_profile.errors.full_messages.should include("Email address must not be blank")
    end
    
  end

end
