class UsersController < ApplicationController
  def new
    @user=User.new
  end

  def create
    # debugger
    @user=User.new(user_params)
    if @user.save
      # session[:user_id]=@user.id
      UserMailer.with(user:@user).welcome_email.deliver_later
      redirect_to login_path, notice:"account created successfully"
    else
      render :new
    end
  end

  private 
  def user_params
    # debugger
    params.require(:user).permit(:username,:email,:password)
  end
end
