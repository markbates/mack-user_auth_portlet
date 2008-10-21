require 'dm-types/bcrypt_hash'
class User
  include DataMapper::Resource
  
  is_paginated
  
  attr_accessor :password_confirmation

  property :id, Serial
  property :username, String
  property :password, BCryptHash
  property :created_at, DateTime
  property :updated_at, DateTime
  
  has 1, :user_profile
  
  validates_is_unique :username
  validates_is_confirmed :password
  validates_present :username
  
  before(:save, :normalize_password)
  before(:save, :check_username_for_updates)
  
  def self.authenticate(username, password)
    user = User.first(:username => username)
    return nil if user.nil?
    user.password == "#{username}#{password}".downcase ? user : nil
  end
  
  private
  # make sure no one can change their username.
  def check_username_for_updates
    if attribute_dirty?(:username) && !new_record?
      self.username = original_values[:username]
    end
  end
  
  def normalize_password
    if attribute_dirty?(:password)
      self.password = "#{self.username}#{self.password}".downcase
    end
  end 
end
