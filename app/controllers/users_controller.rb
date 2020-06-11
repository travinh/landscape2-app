class UsersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]
  def new
    @user = User.new
    3.times { @user.landscapes.build }
    
  end

  def new_github
  end

 
  def create
    
    @user = User.new(user_params)
    
    if @user.save
        
        flash[:notice] = "Created successfully!"
        session[:user_id] = @user.id
        redirect_to '/welcome'
    else
        flash[:error] = @user.errors.full_messages
        redirect_to users_new_path
        # render "new"
    end
 end

 def show 
    if check_user_using_userID
        @user = find_user_byID
        
        if @user
            render "show"
        else
            redirect_to user_path(current_user.id)
        end
    else
        redirect_to user_path(current_user.id)
    end
   
end

 def edit
    if check_user_using_userID
        @user = find_user_byID
        
        if @user
            render 'edit'
        else
            redirect_to user_path(current_user.id)
        end
    else
        redirect_to user_path(current_user.id)
    end
   

end

def update

    
    @user =  find_user_byID

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
    if check_user_using_userID
        @user = find_user_byID
        @user.landscapes.each do |l|
            l.user_id = nil
        end
        @user.destroy
        redirect_to users_path
    else
        redirect_to user_path(current_user.id)
    end
end

    private


    def find_user_byID
        @user2 = User.find_by(id:params[:id])
        @user2
    end


    def user_params
        params.require(:user).permit(:name, :email,:password, :password_digest, :id, :team_id, landscapes_attributes:[:id, :address, :area, :team_id])
    end

end
