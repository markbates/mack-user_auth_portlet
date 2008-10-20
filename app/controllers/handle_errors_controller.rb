class HandleErrorsController
  include Mack::Controller
  
  def unauthorized
    render(:action, :unauthorized, :status => 403)
  end
  
end