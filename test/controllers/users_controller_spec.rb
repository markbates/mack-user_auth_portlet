require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe UsersController do
  
  before(:each) do
    @user = User.first
  end
  
  describe "index" do
    
    it "should list users" do
      get users_index_url
      response.should be_successful
      users = assigns(:users)
      users.should_not be_empty
      users.should include(User.first)
    end
    
  end
  
  describe "show" do
    
    it "should show a user" do
      get users_show_url(:id => @user.id)
      response.should be_successful
      user = assigns(:user)
      user.should == @user
    end
    
    it "should send you to the 404 page if the user is not found" do
      get users_show_url(:id => 10000000)
      response.should be_not_found
      response.body.should match(/We're sorry, we couldn't find the page you were looking for: '#{users_show_url(:id => 10000000)}'/)
    end
    
  end
  
  describe "new" do
    
    it "should show a form to create a new user" do
      get users_new_url
      response.should be_successful
      user = assigns(:user)
      user.should be_new_record
      user.username.should be_nil
    end
    
  end
  
  describe "edit" do
    
    it "should edit a user" do
      session[:user_id] = @user.id
      get users_edit_url(:id => @user.id)
      response.should be_successful
      user = assigns(:user)
      user.password.should be_blank
      user.password_confirmation.should be_blank
      user.should == @user
    end
    
    it "should be redirected to login if you're not logged in" do
      get users_edit_url(:id => 1)
      response.should be_redirected_to(login_url)
    end
    
    it "should raise a 401 if you are not the owner of the user you want to edit" do
      session[:user_id] = @user.id
      get users_edit_url(:id => @user.id + 1)
      response.should be_forbidden
      response.body.should match(/You have tried to access a page you do not have authorization for\./)
      response.body.should match(/#{users_edit_url(:id => (@user.id + 1))}/)
    end
    
  end
  
  describe "create" do
    
    it "should create a user" do
      lambda{
        post users_create_url, :user => {:username => "markbates1", :password => "12345", :password_confirmation => "12345"}, :user_profile => {:email_address => "mark@markbates.com", 'birthdate(year)' => 1976, 'birthdate(month)' => '8', 'birthdate(day)' => 24}
        user = assigns(:user)
        session[:user_id].should_not be_nil
        session[:user_id] = user.id
        response.should be_redirected_to(users_show_url(:id => user))
        delivered_notifiers.size.should == 1
        we = delivered_notifiers.first
        we.subject.should == 'Welcome to GoOnIUserAuthYou.com'
        we.to.should == user.user_profile.email_address
        we.body(:plain).should match(/Welcome: #{user.username}!/)
        we.body(:html).should match(/<h1>Welcome: #{user.username}!<\/h1>/)
      }.should change(User, :count).by(1)
    end
    
  end
  
  describe "update" do
    
    it "should update a user" do
      put users_update_url(:id => @user), :user => {:password => "123456", :password_confirmation => "123456"}
      response.should be_redirect
      response.should be_redirected_to(users_show_url(:id => @user))
      user = assigns(:user)
      user.should == @user
      user.password.should == "#{@user.username}123456".downcase
    end
    
  end
  
  describe "delete" do
    
    it "should delete a user" do
      lambda {
        delete users_delete_url(:id => @user.id)
        response.should be_redirect
        response.should be_redirected_to(users_index_url)
        assigns(:users).should_not include(@user)
      }.should change(User, :count).by(-1)
    end
    
  end
  
  
end
