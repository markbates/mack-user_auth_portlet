require File.join(File.dirname(__FILE__), '..', '..', 'spec_helper')

describe Mack::ViewHelpers::ApplicationHelper do
  include Mack::ViewHelpers

  describe 'user_bio_photo_path' do
    
    before(:each) do
      clean_up_photos
    end
    
    after(:each) do
      clean_up_photos
    end
    
    it 'should return the path for a users bio photo' do
      FileUtils.mkdir_p(File.join(configatron.user_auth.bio_photo.path, 1))
      FileUtils.cp(Mack::Paths.test('mark-simpson.png'), File.join(configatron.user_auth.bio_photo.path, 1, 'bio_photo.png'))
      user_bio_photo_path(1).should == File.join(configatron.user_auth.bio_photo.path, 1, 'bio_photo.png').gsub(Mack::Paths.public, '')
    end
    
    it 'should return the path for a not available photo' do
      user_bio_photo_path(1).should == '/images/not_available.gif'
      user_bio_photo_path(1, :thumb).should == '/images/not_available.gif'
    end
    
    it 'should return the path for a users bio photo thumbnail' do
      FileUtils.mkdir_p(File.join(configatron.user_auth.bio_photo.path, 1))
      FileUtils.cp(Mack::Paths.test('mark-simpson.png'), File.join(configatron.user_auth.bio_photo.path, 1, 'bio_photo_thumb.png'))
      user_bio_photo_path(1, :thumb).should == File.join(configatron.user_auth.bio_photo.path, 1, 'bio_photo_thumb.png').gsub(Mack::Paths.public, '')
    end
    
  end

end