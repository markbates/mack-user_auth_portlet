class UserFactory
  include Mack::Data::Factory

  field :username, :content => :username
  field :password, :default => "password", :immutable => true
  field :password_confirmation, :default => "password", :immutable => true
  field :created_at, :content => :time, :start_time => 3.months.ago, :end_time => Time.now
end