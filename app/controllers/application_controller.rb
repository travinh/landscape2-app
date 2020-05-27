class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authorized
    helper_method :current_user
    helper_method :logged_in?
    helper_method :check_user_using_landscapeID
    helper_method :check_user_using_userID
    helper_method :check_user_using_teamID

    def welcome 
        render "/sessions/welcome"
    end

    def wrong_page
        render "/wrong_page"
    end

  
    def check_user_using_landscapeID
        flag=false
        current_user.landscapes.each do |l|
            if l.id == params[:id].to_i
                flag=true
            end
        end
        flag
    end


    def check_user_using_userID
        flag=false
        if current_user.id == params[:id].to_i

            flag=true
        end
        flag
    end

    def check_user_using_teamID
        flag=false
        current_user.landscapes.each do |l|
            if l.team_id == params[:id].to_i
                flag=true
            end
        end
        flag
    end
  
    def current_user    
        User.find_by(id: session[:user_id])  
    end

    def logged_in?
       
        !current_user.nil?  
    end

    def authorized
        redirect_to '/welcome' unless logged_in?
     end
end
