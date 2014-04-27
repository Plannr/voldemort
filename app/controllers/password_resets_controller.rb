class PasswordResetsController < ApplicationController
    
    def new
        if signed_in?
            signout
            redirect_to new_password_reset_url, notice: "You have been signed out to reset your password."
        end
    end

    def create
        user = User.find_by(email: params[:password_reset][:email].downcase)
        if user
            token = User.hash(User.new_token)
            user.update(token: token)
            Notifications.password_reset(token).deliver
        end
        redirect_to root_url, notice: "Your password reset instructions has been sent to your email."
    end

    def edit
        @user = User.find_by(token: params[:token])
        if @user
            signin(@user)
        end
    end

end
