class UserProfilesController
  include Mack::Controller
  
  # GET /user_profiles/1/edit
  def edit
    @user_profile = UserProfile.get(params[:id])
  end

  # PUT /user_profiles/1
  def update
    @user_profile = UserProfile.get(params[:id])
    if @user_profile.update_attributes(params[:user_profile])
      redirect_to(users_show_url(:id => @user_profile))
    else
      render(:action, "edit")
    end
  end


end