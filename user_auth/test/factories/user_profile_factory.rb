class UserProfileFactory
  include Mack::Data::Factory

  field :email_address, :content => :email
  field :display_name, :content => :name
  field :bio, :length => 250, :content => :alpha
  field :birthdate, :content => :time, :start_time => 70.years.ago, :end_time => 13.years.ago
  association :user_id, {User => 'id'}
end