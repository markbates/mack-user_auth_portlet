require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe UserProfilesController do
  
  before(:each) do
    @user = User.first
  end
  
  describe "edit" do
    
    it "should edit a user_profile" do
      get user_profiles_edit_url(:id => @user.user_profile)
      response.should be_successful
      assigns(:user_profile).should == @user.user_profile
    end
    
  end
  
  describe "update" do
    
    it "should update a user_profile" do
      put user_profiles_update_url(:id => @user.user_profile), :user_profile => {:bio => "I'm a little teapot"}
      response.should be_redirected_to users_show_url(:id => @user)
      user = assigns(:user)
      user.user_profile.bio.should == "I'm a little teapot"
    end
    
  end
  
end
