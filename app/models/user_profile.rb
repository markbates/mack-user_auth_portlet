class UserProfile
  include DataMapper::Resource

  property :id, Serial
  property :email_address, String
  property :display_name, String
  property :bio, Text, :nullable => true
  property :birthdate, Date
  property :updated_at, DateTime
  
  property :user_id, Integer
  
  belongs_to :user
  
  validates_is_unique :email_address
  validates_present :email_address
  
end
