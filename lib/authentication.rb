module UserAuth
  module Authentication
    
    def authorized?
      if is_logged_out?
        redirect_to(login_url)
        return false
      end
      return true
    end
    
    def is_logged_in?
      !session[:user_id].blank?
    end

    def is_logged_out?
      session[:user_id].blank?
    end
    
    def current_user
      ivar_cache do
        unless session[:user_id].blank?
          user = User.get(session[:user_id])
          return user unless user.nil?
          session.delete(:user_id)
          return nil
        end
      end
    end
    
    include_safely_into(Mack::Controller, Mack::Rendering::ViewTemplate)
    
  end
end