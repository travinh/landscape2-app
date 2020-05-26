class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def log_in
       
    end

    def show 
        
        @user = User.find_by(email:params[:email])
        byebug
        if @user && @user.authenticate(params[:user_params])
            session[:user_id] = user.id 
            redirect "/schedules"
            
        else
            redirect "/login"
        end
        
    end



    private

    def user_params
        params.require(:user).permit(:name, :id, :email, :password , :team_id, landscapes_attributes:[:id, :address, :area, :user_id])
    end

end
