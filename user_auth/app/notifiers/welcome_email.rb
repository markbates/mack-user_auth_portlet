class WelcomeEmail
  include Mack::Notifier
  
  attr_accessor :user
  
  def self.compose(user)
    we = WelcomeEmail.new
    we.to = user.user_profile.email_address
    we.subject = configatron.user_auth.emails.welcome.subject
    we.from = configatron.user_auth.emails.welcome.from
    we.user = user
    we
  end
  
  def self.compose_and_deliver(user)
    self.compose(user).deliver
  end
  
end
