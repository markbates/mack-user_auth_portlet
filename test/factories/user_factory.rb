class UserFactory
  include Mack::Data::Factory

  field :username, :content => :username
  field :password do
    'password'
  end
  field :password_confirmation do
    'password'
  end
  field :created_at, :content => :time, :start_time => 3.months.ago, :end_time => Time.now
end