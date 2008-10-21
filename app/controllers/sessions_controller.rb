class SessionsController
  include Mack::Controller
  
  layout :user_auth
  
  def index
    redirect_to(login_url)
  end
  
  def new
   @user = User.new 
  end
  
  def create
    @user = User.authenticate(params[:user][:username], params[:user][:password])
    if @user
      cookies[:foo] = 'bar'
      session[:user_id] = @user.id
      redirect_to(users_show_url(:id => @user))
    else
      @user = User.new(params[:user])
      tell[:notice] = "Authentication Error. Username and/or password was incorrect."
      render(:action, :new)
    end
  end
  
  def logout
    session.reset!
    cookies.delete(:foo)
    redirect_to(login_url)
  end
  
end