class ApplicationController < ActionController::Base
    before_action :authenticate_user! 
    helper_method :current_user, :logged_in?
    private
    def current_user
        @current_user ||=User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def authenticate_user!
        # debugger

        return if ["sessions","users"].include?(params[:controller]) && ["new","create"].include?(params[:action])
      
        if session[:user_id].nil?
            redirect_to login_path
        end
    end
    # def public_auth
    #     params[:controller]:["sessions","users"] && params[:action]:["create","new"]
    # end

end
