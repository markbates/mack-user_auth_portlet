Mack::Routes.build do |r|

  r.resource :user_profiles # Added by rake generate:scaffold name=user_profile
  
  r.resource :users # Added by rake generate:scaffold name=user
  
  r.with_options(:controller => :sessions) do |rc|
    rc.logout "/logout", :action => :logout
    rc.login "/login", :action => :new
    rc.do_login "/login", :action => :create, :method => :post
  end
  
  r.with_options(:controller => "handle_errors") do |rc|
    # rc.with_options(:action => :four_oh_four) do |e|
    #   e.handle_error DataMapper::ObjectNotFoundError
    # end
    rc.handle_error UserAuth::Errors::UnauthorizedAccess, :action => :unauthorized
  end
  
  # r.defaults
  
end
