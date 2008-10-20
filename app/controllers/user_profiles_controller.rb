class UserProfilesController
  include Mack::Controller
  
  layout :user_auth
  
  # GET /user_profiles/1/edit
  def edit
    @user_profile = UserProfile.get(params[:id])
  end

  # PUT /user_profiles/1
  def update
    @user_profile = UserProfile.get(params[:id])
    if @user_profile.update_attributes(params[:user_profile])
      UserAuth::FileUploads::BioPhotos.save_photo(@user_profile.user.id, request.file(:bio_photo))
      redirect_to(users_show_url(:id => @user_profile))
    else
      render(:action, "edit")
    end
  end


end
