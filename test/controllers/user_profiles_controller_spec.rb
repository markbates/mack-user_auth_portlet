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
    
    before(:each) do
      clean_up_photos
    end
    
    after(:each) do
      clean_up_photos
    end
    
    it "should update a user_profile" do
      put user_profiles_update_url(:id => @user.user_profile), :user_profile => {:bio => "I'm a little pony"}
      response.should be_redirected_to users_show_url(:id => @user)
      user = assigns(:user)
      user.user_profile.bio.should == "I'm a little pony"
    end
    
    it 'should save a photo, if uploaded' do
      put user_profiles_update_url(:id => @user.user_profile), :multipart => true, :bio_photo => file_for_upload(Mack::Paths.test('mark-simpson.png')), :user_profile => {:bio => "I'm a little pony"}
      response.should be_redirected_to users_show_url(:id => @user)
      File.should be_exists(File.join(configatron.user_auth.bio_photo.path, @user.id, 'bio_photo.png'))
    end
    
  end
  
end
