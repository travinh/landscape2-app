class UsersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
  def new
    @user = User.new
  end

 
  def create
    @user = User.create(user_params)
   
    if @user.save
        session[:user_id] = @user.id
        redirect_to '/welcome'
    else
        redirect_to '/login'
    end
 end

    private


    def user_params
        params.require(:user).permit(:name, :email,:password, :id, :team_id, landscapes_attributes:[:id, :address, :area, :user_id])
    end

end
