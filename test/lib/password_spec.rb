require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe Mack::User::Password do
  
  it 'should hexdigest a string' do
    password = Mack::User::Password.new('foo')
    password.to_s.should == 'foo'.hexdigest
  end
  
  it 'should equal another string' do
    password = Mack::User::Password.new('foo')
    password.should == 'foo'
  end
  
end