class UsersController
  include Mack::Controller
  
  before_filter :authorized?, :only => [:edit]
  
  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @user = User.get!(params[:id])
    @user_profile = @user.user_profile
  end

  # GET /users/new
  def new
    @user = User.new
    @user_profile = UserProfile.new
  end

  # GET /users/1/edit
  def edit
    raise UserAuth::Errors::UnauthorizedAccess.new unless session[:user_id].to_i == params[:id].to_i
    @user = User.get!(params[:id])
    @user.password = nil
    @user.password_confirmation = nil
  end

  # POST /users
  def create
    @user = User.new(params[:user])
    @user_profile = UserProfile.new({:display_name => @user.username}.merge(params[:user_profile]))
    @user.user_profile = @user_profile
    if @user.save
      WelcomeEmail.compose_and_deliver(@user)
      session[:user_id] = @user.id
      redirect_to(users_show_url(:id => @user))
    else
      render(:action, "new")
    end
  end

  # PUT /users/1
  def update
    @user = User.get!(params[:id])
    if @user.update_attributes((params[:user]))
      redirect_to(users_show_url(:id => @user))
    else
      @user.password = nil
      @user.password_confirmation = nil
      render(:action, "edit")
    end
  end

  # DELETE /users/1
  def delete
    @user = User.get(params[:id])
    @user.destroy
    redirect_to(users_index_url)
  end
  
  def login
    @user = User.new
  end

end
