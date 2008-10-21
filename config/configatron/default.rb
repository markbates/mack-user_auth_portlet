configatron.mack.session_id = '_user_auth_session_id'

configatron.user_auth.emails.welcome.subject = 'Welcome to My Site'
configatron.user_auth.emails.welcome.from = 'notifier@example.com'

configatron.user_auth.bio_photo.path = Mack::Paths.images('bios')
configatron.user_auth.bio_photo.thumb_size = 150

configatron.default_secret_key = '7XYGC447XBG43JCMNG8QTGYFDFZGHK3ALGAG34GY'

configatron.mack.data_mapper.use_repository_runner = true

configatron.user_auth.users_per_page = 20

begin
  require 'image_science'
  configatron.user_auth.use_image_science = true
rescue Exception => e
  puts e
  configatron.user_auth.use_image_science = false
end
