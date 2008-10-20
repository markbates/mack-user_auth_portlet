require File.join(File.dirname(__FILE__), "..", "spec_helper.rb")

describe SessionsController do
  
  describe "new" do
    
    it "should present a login form" do
      get login_url
      assigns(:user).should be_new_record
    end
    
  end
  
  describe "create" do
    
    before(:each) do
      # run_factories(:default)
      @user = User.first
    end
    
    it "should create a new session for a user" do
      post do_login_url, :user => {:username => @user.username, :password => "password"}
      response.should be_redirected_to(users_show_url(:id => @user))
      session[:user_id].should == @user.id
    end
    
    it "should send back to the new page if the user doesn't authenticate" do
      post do_login_url, :user => {:username => @user.username, :password => "1236"}
      response.should be_successful
      user = assigns(:user)
      message = "Authentication Error. Username and/or password was incorrect."
      response.body.should match(/#{message}/)
    end
    
  end
  
  describe "delete" do
    
    it "should delete (logout) a user's session" do
      session[:user_id] = 1
      get logout_url
      session[:user_id].should be_nil
      response.should be_redirected_to(login_url)
    end
    
  end
  
end