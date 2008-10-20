require 'rubygems'
require 'pathname'
require 'spec'

ENV["MACK_ENV"] = "test"
ENV["MACK_ROOT"] = File.join(File.dirname(__FILE__), "..")
load(File.join(File.dirname(__FILE__), "..", "Rakefile"))
require 'mack'

def clean_up_photos
  FileUtils.rm_rf(configatron.user_auth.bio_photo.path)
end