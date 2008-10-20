require File.join(File.dirname(__FILE__), '..', '..', 'spec_helper')

describe Mack::ViewHelpers::ApplicationHelper do
  include Mack::ViewHelpers

  describe 'user_bio_photo' do
    
    before(:each) do
      clean_up_photos
    end
    
    after(:each) do
      clean_up_photos
    end
    
    it 'should create the image tag for a users bio photo' do
      FileUtils.mkdir_p(File.join(configatron.user_auth.bio_photo.path, 1))
      FileUtils.cp(Mack::Paths.test('mark-simpson.png'), File.join(configatron.user_auth.bio_photo.path, 1, 'bio_photo.png'))
      user_bio_photo(1).should == img(File.join(configatron.user_auth.bio_photo.path, 1, 'bio_photo.png').gsub(Mack::Paths.public, ''))
    end
    
    it 'should create the image tag for a not available photo' do
      user_bio_photo(1).should == img('not_available.gif')
    end
    
  end

end