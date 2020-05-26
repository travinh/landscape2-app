class UsersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
  def new
    @user = User.new
    3.times { @user.landscapes.build }
    
  end

 
  def create
   
    @user = User.new(user_params)
    if @user.save
        session[:user_id] = @user.id
        redirect_to '/welcome'
    else
        redirect_to '/login'
    end
 end

 def show 
    @user = User.find_by(id:params[:id])
    
    if @user
        render "show"
    else
        redirect_to users_path
    end
   
end

 def edit
   
    @user = User.find_by(id:params[:id])
    if @user
        render 'edit'
    else
        redirect_to users_path
    end
end

def update

    
    @user =  User.find_by(id:params[:id])
    if @user
        @user.update(user_params)
        if @user.errors.any?
            render "edit"
        else
            redirect_to @user
        end
    else
        render "edit"
    end
  
end

def destroy
    @user = User.find_by(id:params[:id])
    @user.landscapes.each do |l|
        l.user_id = nil
    end
    @user.destroy
    redirect_to users_path
end

    private


    def user_params
        params.require(:user).permit(:name, :email,:password, :password_digest, :id, :team_id, landscapes_attributes:[:id, :address, :area, :team_id])
    end

end
