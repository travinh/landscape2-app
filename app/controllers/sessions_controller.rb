class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome, :create_github]
  def new
  end

  def create
    
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
        
        session[:user_id] = @user.id
        redirect_to '/welcome'
    else
        redirect_to '/login'
    end
  end

  def create_github 

    @user = User.find_or_create_by_auth(request.env['omniauth.auth'])
    if @user
      byebug
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to '/welcome'
    end
  #   byebug
  #   @user = User.find_or_create_from_auth_hash(auth_hash)
   
  #   self.current_user = @user
  #   redirect_to user_path(@user)
  end

  def login

  end

  def welcome
    
    @user = current_user

  end

  def page_requires_login
    
  end

  def destroy     
    session[:user_id] = nil           
    redirect_to '/welcome' 
  end 

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
