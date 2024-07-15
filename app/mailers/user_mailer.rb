class UserMailer < ApplicationMailer
    default from: 'ritikamishra.reet.233@gmail.com'

    def welcome_email
        @user=params[:user]
        @url="http://example.com/login"
        mail(to:@user.email, subject:'Welcome to my app')
    end
end
