require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe UserAuth::Authentication do
  include UserAuth::Authentication
  
  before(:each) do
    @redirect_url = nil
    @user = User.first
    session[:user_id] = nil
  end
  
  def redirect_to(url)
    @redirect_url = url
  end
  
  describe "authorized?" do
    
    it "should redirect to the login_url if the user is logged out" do
      authorized?.should == false
      @redirect_url.should == login_url
    end
    
    it "should return tru if the user is logged in" do
      session[:user_id] = 1
      authorized?.should == true
    end
    
  end
  
  describe "is_logged_in?" do
    
    it "should return true if there is an user_id in the session" do
      session[:user_id] = 1
      is_logged_in?.should == true
    end
    
    it "should return false if there isn't an user_id in the session" do
      is_logged_in?.should == false
    end
    
  end
  
  describe "is_logged_out?" do
    
    it "should return false if there is an user_id in the session" do
      is_logged_out?.should == true
    end
    
    it "should return true if there isn't an user_id in the session" do
      session[:user_id] = 1
      is_logged_out?.should == false
    end
    
  end
  
  describe "current_user" do
    
    it "should return the current user" do
      session[:user_id] = @user.id
      current_user.should == @user
    end
    
    it "should return nil if there is no user_id in the session" do
      current_user.should be_nil
    end
    
    it "should return nil and delete the user_id from the session if the user doesn't exist" do
      session[:user_id] = 99999
      current_user.should be_nil
      session[:user_id].should be_nil
    end
    
  end
  
end