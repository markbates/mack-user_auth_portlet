require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe WelcomeEmail do

  before(:each) do
    @user = User.first
  end

  describe "compose" do
    
    it "should take a user and compose a welcome email from it" do
      delivered_notifiers.should be_empty
      we = WelcomeEmail.compose(@user)
      we.should be_is_a(WelcomeEmail)
      we.to.should == @user.user_profile.email_address
      we.from.should == configatron.user_auth.emails.welcome.from
      we.subject.should == configatron.user_auth.emails.welcome.subject
      we.body(:plain).should match("Welcome: #{@user.user_profile.display_name}!")
      we.body(:html).should match("<h1>Welcome: #{@user.user_profile.display_name}!</h1>")
      delivered_notifiers.should be_empty
    end
    
  end
  
  describe "compose_and_deliver" do
    
    it "should take a user, compose a welcome email from it, and send it" do
      delivered_notifiers.should be_empty
      WelcomeEmail.compose_and_deliver(@user)
      delivered_notifiers.should_not be_empty
      we = delivered_notifiers.first
      we.should be_is_a(WelcomeEmail)
      we.to.should == @user.user_profile.email_address
      we.from.should == configatron.user_auth.emails.welcome.from
      we.subject.should == configatron.user_auth.emails.welcome.subject
      we.body(:plain).should match("Welcome: #{@user.user_profile.display_name}!")
      we.body(:html).should match("<h1>Welcome: #{@user.user_profile.display_name}!</h1>")
    end
    
  end

end
