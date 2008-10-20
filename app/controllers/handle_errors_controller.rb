class HandleErrorsController
  include Mack::Controller
  
  layout :user_auth
  
  def unauthorized
    render(:action, :unauthorized, :status => 403)
  end
  
end