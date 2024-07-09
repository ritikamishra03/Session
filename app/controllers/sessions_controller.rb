class SessionsController < ApplicationController
  def new
  end

  def create
    # debugger
    user=User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id]=user.id 
      redirect_to home_path, notice:'logged in successfully'
    # if user = User.authenticate_by(params[:username], params[:password])
    #   session[:user_id] = user.id
    #   redirect_to root_path, notice:'logged in successfully'
    else
      flash.now[:error]='Invalid username or password'
      render :new
    end

  end

  def destroy
    # debugger
    session.delete(:user_id)
    session[:user_id]=nil
    redirect_to root_path, notice:'logged out successfully'
  end
end
