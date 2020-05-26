class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def welcome 
        render "/welcome"
    end

    def wrong_page
        render "/wrong_page"
    end

  
    
  
      helpers do
    
        def logged_in?
          !!session[:user_id]
        end
    
        def current_user
          @user ||= User.find_by_id(session[:user_id]) if logged_in?
        end
    
        def redirect_if_not_loggedin
          if !logged_in?
              redirect_to log_in_path
          end
        end
    
    end
end
