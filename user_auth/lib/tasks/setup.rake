task :setup => ["db:recreate:all", "db:migrate"] do
  100.times do
    name = Faker::Name.name
    user_profile = UserProfile.new(:display_name => name, :bio => Faker::Lorem.paragraphs(rand(5)), 
                                   :email_address => Faker::Internet.email(name),
                                   :birthdate => Time.random(70.years.ago, 13.years.ago))
    User.create(:username => Faker::Internet.user_name(name), :password => "password", 
                :password_confirmation => "password", :user_profile => user_profile,
                :created_at => Time.random(90.days.ago))
  end
end